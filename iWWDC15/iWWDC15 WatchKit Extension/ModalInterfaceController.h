//
//  ModalInterfaceController.h
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 11/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ModalInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblCreditsFirstPart;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblCreditsLastPart;

@end
