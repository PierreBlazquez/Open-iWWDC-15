//
//  NotificationHelper.h
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationHelper : NSObject

/**
 * @return NSArray An array of dates in a text format
 */
+ (NSArray *)getDates;

/**
 * @return NSString A string representing the dates
 */
+ (NSString *)getDateFormat;

/**
 * @return NSArray An array of strings for each date
 */
+ (NSArray *)getTexts;

@end
