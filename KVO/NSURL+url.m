//
//  NSURL+url.m
//  KVO
//
//  Created by jyd on 2017/7/6.
//  Copyright © 2017年 jyd. All rights reserved.
//

/**
 *思路:HOOK
 *目的: 调用的都是系统的URLWithString方法 
        在运行的时候Hook住系统的方法
        修改为自己的检测是否为空的方法
 */

#import "NSURL+url.h"
#import "NSObject+Swizzling.h"

@implementation NSURL (url)

+ (void)load
{
    //下钩子
    //拿到两个Method
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self DYW_methodSwizlingWithOriginalSelector:@selector(URLWithString:) swizzledSelector:@selector(DYW_URLWithStr:)];
    });
}



+ (instancetype)DYW_URLWithStr:(NSString *)str
{
    NSURL *url = [NSURL DYW_URLWithStr:str];
    if (!url) {
        NSLog(@"null");
    }
    
    return url;
}

@end
