//
//  UIViewController+TimJ_Storyboards.h
//  Storyboard
//
//  Created by Timothy Johnson on 8/9/15.
//  Copyright (c) 2015 Timothy Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Kamcord_Storyboards)

+ (instancetype)kamcord_instantiateWithStoryboardNamed:(NSString *)storyboardName;

+ (instancetype)kamcord_instantiateViewControllerClass:(Class)class withStoryboardName:(NSString *)storyboardName;

+ (instancetype)kamcord_instantiateViewControllerName:(NSString *)identifier
                                   withStoryboardName:(NSString *)storyboardName;

@end

@interface UIStoryboard (Kamcord_Storyboards)

+ (instancetype)kamcord_storyboardNamed:(NSString *)storyboardName;

@end
