//
//  TodayViewController.m
//  iWWDC Center
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    /* We don't like Apple's default margin insets. We'll use our own. */
    return UIEdgeInsetsMake(8, 12, 12, 0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /* If we need a timer, set it. Else, just do the 'Happening' stuff */
    NSLog(@"%s: We will appear! We have to launch that damn timer!", __PRETTY_FUNCTION__);
    if ([self determineIfWeNeedATimer]) {
        myMagicTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myMagicLoop) userInfo:nil repeats:YES];
    }
    else {
        [self itIsHappening];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s: We will disappear! Time to reduce our memory footprint.", __PRETTY_FUNCTION__);
    [myMagicTimer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)determineIfWeNeedATimer {
    duration = [TimeHelper durationBetween:[NSDate date] and:[TimeHelper dateFromString:kWWDCDate usingFormat:kWWDCDateFormat]];
    if (duration > 0) {
        return YES;
    }
    return NO;
}

- (void)myMagicLoop {
    /* We won't talk shit using NSLog on this loop, we need timers to be efficient. */
    if ([self determineIfWeNeedATimer]) {
        self.lblCountdown.text = [TimeHelper getFormattedStringForDuration:duration];
    }
    else {
        [myMagicTimer invalidate];
        [self itIsHappening];
    }
}

- (void)itIsHappening {
    NSLog(@"%s: It's happening! A-MA-ZING!", __PRETTY_FUNCTION__);
    self.lblCountdown.text = @"Mayas were right, it is happening!";
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    /* No thanks, we will use our own logic. */
    completionHandler(NCUpdateResultNoData);
}

@end
