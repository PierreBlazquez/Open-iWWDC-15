//
//  LocalNotificationHelper.h
//  Let's deal with local notification easily! Part of the iWWDC15 Open Source edition project
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LocalNotificationHelper : NSObject

/**
 * You don't want to mess with that
 */
+ (int)sharedCpt;

/**
 * Tell iOS that the app offers notifications. User has to accept them.
 */
+ (void)registerForLocalNotifications;

/**
 * @param NSDate date The date when the notification will appear
 * @param NSString text Some body for the alert
 */
+ (void)newLocalNotificationForDate:(NSDate *)date andText:(NSString *)text withTitle:(NSString *)title;

/**
 * @return NSArray An array of UILocalNotifications
 */
+ (NSArray *)getLocalNotifications;

/**
 * @param UILocalNotification notification The local notification to cancel
 */
+ (void)cancelLocalNotification:(UILocalNotification *)notification;

/**
 * Not documented.
 */
+ (void)_internal_displayNotifications;

/**
 * Delete every local notifications
 */
+ (void)cancelAllNotifications;

@end
