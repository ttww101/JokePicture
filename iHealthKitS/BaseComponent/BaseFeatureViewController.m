//
//  BaseFeatureViewController.m
//  iHealthS
//
//  Created by Wu on 2019/4/9.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import "BaseFeatureViewController.h"

@implementation BaseFeatureViewController

- (void)featureVCPushVC:(UIViewController *)pushVC animated:(BOOL)animated {
    
    RESideMenu *vc = (RESideMenu *)[UIApplication sharedApplication].delegate.window.rootViewController;
    
    UINavigationController *currentNav = (UINavigationController *)vc.contentViewController;
    
    [currentNav pushViewController:pushVC animated:animated];
}

- (void)featureVCPresentVC:(UIViewController *)presentVC animated:(BOOL)animated {
    RESideMenu *vc = (RESideMenu *)[UIApplication sharedApplication].delegate.window.rootViewController;
    
    UINavigationController *currentNav = (UINavigationController *)vc.contentViewController;
    
    UIViewController *currentVC = currentNav.viewControllers.lastObject;
    
    [currentVC presentViewController:presentVC animated:animated completion:nil];
}

@end
