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
#import <objc/runtime.h>

@implementation NSURL (url)

+ (void)load
{
    //下钩子
    //拿到两个Method
    Method URLWS = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method DYWWS = class_getClassMethod([NSURL class], @selector(DYW_URLWithStr:));
    
    //交换实现方法
    method_exchangeImplementations(URLWS, DYWWS);
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
