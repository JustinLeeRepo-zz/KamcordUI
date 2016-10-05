//
//  UIViewController+TimJ_Storyboards.m
//  Storyboard
//
//  Created by Timothy Johnson on 8/9/15.
//  Copyright (c) 2015 Timothy Johnson. All rights reserved.
//

#import "UIViewController+Kamcord_Storyboards.h"

@implementation UIViewController (Kamcord_Storyboards)

+ (instancetype)kamcord_instantiateWithStoryboardNamed:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard kamcord_storyboardNamed:storyboardName];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

+ (instancetype)kamcord_instantiateViewControllerClass:(Class)class
                                    withStoryboardName:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard kamcord_storyboardNamed:storyboardName];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(class)];
}

+ (instancetype)kamcord_instantiateViewControllerName:(NSString *)identifier
                                withStoryboardName:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard kamcord_storyboardNamed:storyboardName];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end

@implementation UIStoryboard (Kamcord_Storyboards)

+ (instancetype)kamcord_storyboardNamed:(NSString *)storyboardName
{
    return [UIStoryboard storyboardWithName:storyboardName
                                     bundle:[NSBundle mainBundle]];
}

@end
