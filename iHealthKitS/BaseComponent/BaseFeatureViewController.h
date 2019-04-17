//
//  BaseFeatureViewController.h
//  iHealthS
//
//  Created by Wu on 2019/4/9.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFeatureViewController : UIViewController

- (void)featureVCPushVC:(UIViewController *)pushVC animated:(BOOL)animated;
- (void)featureVCPresentVC:(UIViewController *)presentVC animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
