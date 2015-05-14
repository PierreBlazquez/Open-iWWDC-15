//
//  ViewController.h
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 08/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "TimeHelper.h"
#import "ScreenshotHelper.h"
#import "LocalNotificationHelper.h"
#import "NotificationHelper.h"

@interface ViewController : UIViewController {
    NSTimer *myMagicTimer;
    NSTimeInterval duration;
    BOOL areWeInABugFixingContext;
}

@property (weak, nonatomic) IBOutlet UILabel *lblWWDC;
@property (weak, nonatomic) IBOutlet UILabel *lblHazStarted;
@property (weak, nonatomic) IBOutlet UILabel *lblYesNo;
@property (weak, nonatomic) IBOutlet UILabel *lblCountdown;

@end

