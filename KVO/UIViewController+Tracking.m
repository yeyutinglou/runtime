//
//  UIViewController+Tracking.m
//  KVO
//
//  Created by jyd on 2017/7/10.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController (Tracking)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self DYW_methodSwizlingWithOriginalSelector:@selector(viewWillAppear:) swizzledSelector:@selector(DYW_viewWillAppear:)];
    });
}


- (void)DYW_viewWillAppear:(BOOL)animated
{
    [self DYW_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@",self);
}

@end
