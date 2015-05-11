//
//  GlanceController.m
//  iWWDC15 WatchKit Extension
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "GlanceController.h"


@interface GlanceController()

@end


@implementation GlanceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self.timer setDate:[TimeHelper dateFromString:kWWDCDate usingFormat:kWWDCDateFormat]];
    [self.timer start];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    [self.timer stop];
}

@end



