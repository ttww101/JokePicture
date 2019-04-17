//
//  Feature2ViewController.m
//  iHealthS
//
//  Created by Wu on 2019/3/13.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import "Feature2ViewController.h"
#import "UIView+Constraint.h"

@interface Feature2ViewController ()

@end

@implementation Feature2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [view constraintsCenterX:self.view toLayoutAttribute:NSLayoutAttributeCenterX];
    [view constraintsCenterY:self.view toLayoutAttribute:NSLayoutAttributeCenterY];
    [view constraintsWidthWithConstant:50];
    [view constraintsHeightWithConstant:50];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
