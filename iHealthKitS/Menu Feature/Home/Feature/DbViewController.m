//
//  DbViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/16.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import "DbViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DbViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) AVAudioRecorder *recorder;
@property (strong, nonatomic) NSTimer *levelTimer;
@end

@implementation DbViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* 必须添加这句话，否则在模拟器可以，在真机上获取始终是0  */
    [[AVAudioSession sharedInstance]
     setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];

    /* 不需要保存录音文件 */
    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];

    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax], AVEncoderAudioQualityKey,
                              nil];

    NSError *error;
    _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    if (_recorder)
    {
        [_recorder prepareToRecord];
        _recorder.meteringEnabled = YES;
        [_recorder record];
        _levelTimer = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
    }
    else
    {
        NSLog(@"%@", [error description]);
    }
    
}


/* 该方法确实会随环境音量变化而变化，但具体分贝值是否准确暂时没有研究 */
- (void)levelTimerCallback:(NSTimer *)timer {
    [_recorder updateMeters];
    
    float   level;                // The linear 0.0 .. 1.0 value we need.
    float   minDecibels = -80.0f; // Or use -60dB, which I measured in a silent room.
    float   decibels    = [_recorder averagePowerForChannel:0];
    
    if (decibels < minDecibels)
    {
        level = 0.0f;
    }
    else if (decibels >= 0.0f)
    {
        level = 1.0f;
    }
    else
    {
        float   root            = 2.0f;
        float   minAmp          = powf(10.0f, 0.05f * minDecibels);
        float   inverseAmpRange = 1.0f / (1.0f - minAmp);
        float   amp             = powf(10.0f, 0.05f * decibels);
        float   adjAmp          = (amp - minAmp) * inverseAmpRange;
        
        level = powf(adjAmp, 1.0f / root);
    }
    
    /* level 范围[0 ~ 1], 转为[0 ~120] 之间 */
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *str = [NSString stringWithFormat:@"%.1f", level*120];
        _label.text = str;
        NSLog(str);
    });
}


@end
