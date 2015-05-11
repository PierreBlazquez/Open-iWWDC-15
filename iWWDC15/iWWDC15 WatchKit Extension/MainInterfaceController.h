//
//  MainInterfaceController.h
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 11/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "TimeHelper.h"

#define kWWDCDate @"2015-6-8 10:00:00 -0800"
#define kWWDCDateFormat @"yyyy-L-d HH:mm:ss Z"

@interface MainInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblHazItStarted;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblYesNo;

@end
