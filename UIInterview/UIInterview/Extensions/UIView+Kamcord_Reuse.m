//
//  UIView+TimJ_Reuse.m
//  Storyboard
//
//  Created by Timothy Johnson on 8/9/15.
//  Copyright (c) 2015 Timothy Johnson. All rights reserved.
//

#import "UIView+Kamcord_Reuse.h"

@implementation UIView (Kamcord_Reuse)

+ (UINib *)kamcord_nibNamed:(NSString *)nibName
{
    return [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
}

+ (UINib *)kamcord_nib
{
    return [self kamcord_nibNamed:NSStringFromClass([self class])];
}

+ (instancetype)kamcord_instantiateWithNibNamed:(NSString *)nibName
{
    UIView *result = nil;
    UINib *nib = [self kamcord_nibNamed:nibName];
    NSArray *topLevelObjects = [nib instantiateWithOwner:nil options:nil];
    
    for (id anObject in topLevelObjects)
    {
        if ([anObject isKindOfClass:[self class]])
        {
            result.translatesAutoresizingMaskIntoConstraints = NO;
            result = anObject;
            break;
        }
    }
    return result;
}

+ (instancetype)kamcord_instantiateFromNib
{
    return [self kamcord_instantiateWithNibNamed:NSStringFromClass([self class])];
}

@end

@implementation UIView (Kamcord_ReusableIdentifier)

+ (NSString *)kamcord_reusableIdentifier
{
    return NSStringFromClass([self class]);
}

@end
