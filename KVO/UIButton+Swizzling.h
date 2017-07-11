//
//  UIButton+Swizzling.h
//  KVO
//
//  Created by jyd on 2017/7/10.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 1

@interface UIButton (Swizzling)

/** 间隔 */
@property (nonatomic, assign) NSTimeInterval timeInterval;

/** 是否忽略事件 */
@property (nonatomic, assign) BOOL isIgnore;

@end
