//
//  Cat.m
//  KVO练习
//
//  Created by apple on 14/10/13.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"响应了这个方法");
}

@end
