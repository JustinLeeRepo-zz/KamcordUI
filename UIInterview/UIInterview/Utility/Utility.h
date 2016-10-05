//
//  Utility.h
//  UIInterview
//
//  Created by Tim Johnson on 11/5/15.
//  Copyright © 2015 Kamcord. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

/**
 Returns a height for a width that provides a 16:9 ratio from width to height
 **/

+ (CGFloat)heightWithDesiredRatioForWidth:(CGFloat)width;

/**
 Returns a width for a height that provides a 16:9 ratio from width to height
 **/

+ (CGFloat)widthWithDesiredRatioForHeight:(CGFloat)height;

@end
