//
//  NSObject+Property.m
//  KVO
//
//  Created by jyd on 2017/7/6.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>


@implementation NSObject (Property)

- (NSString *)name
{
    //根据关联的key,获取值
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @selector(setName:), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
