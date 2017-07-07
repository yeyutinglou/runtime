//
//  man.m
//  KVO
//
//  Created by jyd on 2017/7/4.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "Man.h"

@implementation Man

- (void)setName:(NSString *)name
{
    [self willChangeValueForKey:@"name"];
    [super setName:name];
    [self didChangeValueForKey:@"name"];
}

@end
