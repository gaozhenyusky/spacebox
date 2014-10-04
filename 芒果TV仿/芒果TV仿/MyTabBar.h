//
//  MyTabBar.h
//  芒果TV仿
//
//  Created by apple on 14-10-4.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

@optional
- (void) myTabBar :(MyTabBar *)myTabBar selectAtIndex :(NSInteger)index;

@end

@interface MyTabBar : UIView
@property (nonatomic,assign) NSInteger selectedIndex;
@property (nonatomic,copy) NSArray *items;
@property (nonatomic,strong) UIImage *backgroundImage;
@property (nonatomic,weak) id<MyTabBarDelegate>delegate;
@end
