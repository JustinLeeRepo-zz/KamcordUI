//
//  UIView+TimJ_Reuse.h
//  Storyboard
//
//  Created by Timothy Johnson on 8/9/15.
//  Copyright (c) 2015 Timothy Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Kamcord_Reuse)

+ (UINib *)kamcord_nibNamed:(NSString *)nibName;
+ (UINib *)kamcord_nib;

+ (instancetype)kamcord_instantiateWithNibNamed:(NSString *)nibName;
+ (instancetype)kamcord_instantiateFromNib;

@end

@interface UIView (Kamcord_ReusableIdentifier)

+ (NSString *)kamcord_reusableIdentifier;

@end
