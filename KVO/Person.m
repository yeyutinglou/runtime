//
//  Person.m
//  KVO
//
//  Created by jyd on 2017/7/4.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person

// 默认方法都有两个隐式参数
void eat(id self, SEL sel)
{
    NSLog(@"%@ %@",self, NSStringFromSelector(sel));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat)) {
        //动态添加eat方法
        class_addMethod(self, @selector(eat), (IMP)eat, "v@:@");

    }
    
    return [super resolveInstanceMethod:sel];
}


@end
