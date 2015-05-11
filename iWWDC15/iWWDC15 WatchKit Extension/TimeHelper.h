//
//  TimeHelper.h
//  Let's deal with dates easily. Part of the iWWDC15 Open Source Edition project.
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeHelper : NSObject

/**
 * @param NSTimeInterval duration The duration
 * @return NSString The string that corresponds to the given duration
 */
+ (NSString *)getFormattedStringForDuration:(NSTimeInterval)duration;

/**
 * @param NSDate date1 The first date
 * @param NSDate date2 The date to compare date1 with
 * @return NSTimeInterval The interval between date1 and date2
 */
+ (NSTimeInterval)durationBetween:(NSDate *)date1 and:(NSDate *)date2;

/**
 * @param NSString string The string that contains the date
 * @param NSString format The string that represents the date format
 * @return NSDate The NSDate object that corresponds the the given NSString string
 */
+ (NSDate *)dateFromString:(NSString *)string usingFormat:(NSString *)format;

@end
