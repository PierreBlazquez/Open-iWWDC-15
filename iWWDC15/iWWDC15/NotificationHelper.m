//
//  NotificationHelper.m
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "NotificationHelper.h"

@implementation NotificationHelper

+ (NSArray *)getDates {
    return @[@"2015-6-8 00:00:01 -0800", @"2015-6-8 09:00:00 -0800", @"2015-6-8 09:30:00 -0800", @"2015-6-8 09:50:00 -0800", @"2015-6-8 09:55:00 -0800", @"2015-6-8 10:00:00 -0800"];
}

+ (NSString *)getDateFormat {
    return @"yyyy-L-d HH:mm:ss Z";
}

+ (NSArray *)getTexts {
    return @[@"WWDC15 kicks off TODAY!", @"WWDC15 kicks off in an hour!", @"WWDC15 kicks off in half an hour!", @"WWDC15 kicks off in 10 mins!", @"Brace yourself, WWDC15 starts in 5 minutes!", @"WWDC15 starts... NOW!"];
}

@end
