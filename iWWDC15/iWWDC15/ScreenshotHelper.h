//
//  ScreenshotHelper.h
//  Let's screenshot views easily. Part of the iWWDC15 Open Source Edition project
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScreenshotHelper : NSObject

/**
 * @param UIView view The view to take a snapshot of
 * @return UIImage An image of the given view
 */
+ (UIImage *)snapshot:(UIView *)view;

@end
