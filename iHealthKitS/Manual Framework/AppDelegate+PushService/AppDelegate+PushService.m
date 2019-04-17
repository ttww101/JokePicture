//
//  AppDelegate+PushService.m
//  LiMagicTutorial
//
//  Created by Wu on 2019/4/1.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import "AppDelegate+PushService.h"
#import "JPUSHService.h"
#import <UserNotifications/UserNotifications.h>
#import "JANALYTICSService.h"
#import "ADWebViewController.h"
#import "NSString+URL.h"
#import <AdSupport/AdSupport.h>
#import <AVOSCloud/AVOSCloud.h>
#import "HomeViewController.h"

@implementation AppDelegate (PushService)

#pragma mark - Push Service

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
    }else{
        //从通知设置界面进入应用
    }
}

//背景觸發
- (void)jpushNotificationCenter :(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    NSLog(@"%@", userInfo);
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();
}

//前景觸發
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    NSLog(@"%@", userInfo);
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        
        completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    if (@available(iOS 10.0, *)) {
        /*iOS 10.0 以上
         [UNUserNotificationCenterDelegate willPresentNotification:withCompletionHandler:]方法中调用completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);即可
         */
    } else {
        [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler: (void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}


@end
