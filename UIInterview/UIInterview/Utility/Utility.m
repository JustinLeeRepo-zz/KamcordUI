//
//  Utility.m
//  UIInterview
//
//  Created by Tim Johnson on 11/5/15.
//  Copyright © 2015 Kamcord. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (CGFloat)widthToHeightRatio {
    
    return (16. / 9.);
}

+ (CGFloat)heightWithDesiredRatioForWidth:(CGFloat)width {
    
    CGFloat height = width / ([self widthToHeightRatio]);
    return height;
}

+ (CGFloat)widthWithDesiredRatioForHeight:(CGFloat)height {
    
    CGFloat width = height * ([self widthToHeightRatio]);
    return width;
}

@end
