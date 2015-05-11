//
//  ScreenshotHelper.m
//  Let's screenshot views easily. Part of the iWWDC15 Open Source Edition project
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "ScreenshotHelper.h"

@implementation ScreenshotHelper

/* From Apple Developer doc */
+ (UIImage *)snapshot:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
