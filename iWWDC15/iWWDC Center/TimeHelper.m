//
//  TimeHelper.m
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "TimeHelper.h"

@implementation TimeHelper

+ (NSString *)getFormattedStringForDuration:(NSTimeInterval)duration {
    /* Based on some good-looking code found on the UNiNTERNET */
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:duration sinceDate:date1];
    
    unsigned int units = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay;
    
    NSDateComponents *conversion = [calendar components:units fromDate:date1  toDate:date2  options:0];
    
    return [NSString stringWithFormat:@"%ldd %ldh %ldm %lds", (long)[conversion day], (long)[conversion hour], (long)[conversion minute], (long)[conversion second]];
}

+ (NSTimeInterval)durationBetween:(NSDate *)date1 and:(NSDate *)date2 {
    return [date2 timeIntervalSinceDate:date1];
}

+ (NSDate *)dateFromString:(NSString *)string usingFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}

@end
