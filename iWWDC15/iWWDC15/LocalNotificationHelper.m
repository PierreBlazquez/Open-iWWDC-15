//
//  LocalNotificationHelper.m
//  Let's deal with local notification easily! Part of the iWWDC15 Open Source edition project
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "LocalNotificationHelper.h"

@implementation LocalNotificationHelper

+ (int)sharedCpt {
    static int c;
    c++;
    NSLog(@"%s: New cpt: %d", __PRETTY_FUNCTION__, c);
    return c;
}

+ (void)registerForLocalNotifications {
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

+ (void)newLocalNotificationForDate:(NSDate *)date andText:(NSString *)text withTitle:(NSString *)title {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = date;
    localNotification.alertBody = text;
    localNotification.alertTitle = title;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [LocalNotificationHelper sharedCpt];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

+ (NSArray *)getLocalNotifications {
    return [[UIApplication sharedApplication] scheduledLocalNotifications];
}

+ (void)cancelLocalNotification:(UILocalNotification *)notification {
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
}

+ (void)cancelAllNotifications {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

+ (void)_internal_displayNotifications {
    NSMutableString *n = [[NSMutableString alloc] init];
    NSArray *notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    int c = (int)notifications.count;
    
    for (int i = 0; i < c; i++) {
        UILocalNotification *notification = (UILocalNotification *)[notifications objectAtIndex:i];
        NSString *t = [NSString stringWithFormat:@"%d: (%@) %@\n", i, notification.fireDate, notification.alertBody];
        [n appendString:t];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"[INTERNAL] Notifications" message:n delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
