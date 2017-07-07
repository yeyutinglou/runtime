//
//  Person.h
//  KVO
//
//  Created by jyd on 2017/7/4.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weman.h"
@interface Person : NSObject


@property (nonatomic, copy) NSString *name;

/** age */
@property (nonatomic, assign) int age;

/** array */
@property (nonatomic, strong) NSArray *array;

/** dic */
@property (nonatomic, strong) Weman *weman;


- (void)eat;

@end
