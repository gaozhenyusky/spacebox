//
//  MyTabBarItem.m
//  芒果TV仿
//
//  Created by apple on 14-10-4.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "MyTabBarItem.h"


@implementation MyTabBarItem

- (id)initWithImage :(UIImage *)image title :(NSString *)title
{
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
    }
    return self;
}

@end
