//
//  NSObject+Property.m
//  KVO
//
//  Created by jyd on 2017/7/6.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>
//定义关联的key
static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name
{
    //根据关联的key,获取值
    return objc_getAssociatedObject(self, key);
}

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
