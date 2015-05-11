//
//  TodayViewController.h
//  iWWDC Center
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NotificationCenter/NotificationCenter.h>
#import "TimeHelper.h"

#define kWWDCDate @"2015-6-8 10:00:00 -0800"
#define kWWDCDateFormat @"yyyy-L-d HH:mm:ss Z"

@interface TodayViewController : UIViewController {
    NSTimer *myMagicTimer;
    NSTimeInterval duration;
}

@property (weak, nonatomic) IBOutlet UILabel *lblCountdown;

@end
