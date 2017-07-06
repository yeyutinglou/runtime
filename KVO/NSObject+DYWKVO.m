//
//  NSObject+DYWKVO.m
//  KVO
//
//  Created by jyd on 2017/7/5.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "NSObject+DYWKVO.h"
#import <objc/message.h>
@implementation NSObject (DYWKVO)

- (void)DYW_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    //动态的生成一个类
    //动态类名
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newName = [@"NSDYW_" stringByAppendingString:oldClassName];
    //定义一个类
    const char *newClassName = [newName UTF8String];
    Class myClass = objc_allocateClassPair([self class], newClassName, 0);
    //添加setName方法- 重写一个方法
    class_addMethod(myClass, @selector(setName:), (IMP)setName, "v@:@");
    
    //注册该类
    objc_registerClassPair(myClass);
    
    //修改被观察者的isa指针  让它指向自己的类
    object_setClass(self, myClass);
    
    //动态绑定属性
    objc_setAssociatedObject(self, (__bridge const void *)@"123", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

void setName(id self, SEL _cmd, NSString *newname)
{
    //保存当前类型
    id class = [self class];
    //改变当前对象指向父类
    object_setClass(self, class_getSuperclass([self class]));
    //调用父类的setName方法
    objc_msgSend(self, @selector(setName:),newname);
    //拿出观察者
    id observer = objc_getAssociatedObject(self, (__bridge const void *)@"123");
    //通知外界
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:), self, @"name", @{@"new" : newname}, nil);
    
    //改回子类类型
    object_setClass(self, class);
    
    
    
}
@end
