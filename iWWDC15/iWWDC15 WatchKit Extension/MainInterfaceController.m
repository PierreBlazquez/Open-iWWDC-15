//
//  MainInterfaceController.m
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 11/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "MainInterfaceController.h"

@interface MainInterfaceController ()

@end

@implementation MainInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    NSTimeInterval test = [TimeHelper durationBetween:[NSDate date] and:[TimeHelper dateFromString:kWWDCDate usingFormat:kWWDCDateFormat]];
    if (test > 0) {
        [self.lblYesNo setText:@"NO"];
        [self.lblYesNo setTextColor:[UIColor redColor]];
    }
    else {
        [self.lblYesNo setText:@"YES"];
        [self.lblYesNo setTextColor:[UIColor greenColor]];
    }
}

- (IBAction)openModalController {
    NSLog(@"%s: Touch me harder!", __PRETTY_FUNCTION__);
    [self presentControllerWithName:@"Modal" context:nil];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



