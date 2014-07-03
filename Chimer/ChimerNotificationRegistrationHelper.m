//
//  ChimerNotificationRegistrationHelper.m
//  Chimer
//
//  Created by Daniel R on 7/3/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

#import "ChimerNotificationRegistrationHelper.h"
#import <UIKit/UIKit.h>

@implementation ChimerNotificationRegistrationHelper
+(void)registerForSoundLocalNotifications {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications]; // you can also set here for local notification.
#else
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:notificationTypes];
#endif
}

@end
