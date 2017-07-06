//
//  NSObject+DYWKVO.h
//  KVO
//
//  Created by jyd on 2017/7/5.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DYWKVO)


- (void)DYW_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
