//
//  MyTabBar.m
//  芒果TV仿
//
//  Created by apple on 14-10-4.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "MyTabBar.h"
@interface MyTabBar ()
{
    UIImageView *bgView;
    NSMutableArray *btnArray;
}
@end

@implementation MyTabBar

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bgView = [[UIImageView alloc] initWithFrame:self.bounds];
        bgView.image = [UIImage imageNamed:@"TabBarBackground.png"];
        [self addSubview:bgView];
        
        btnArray = [NSMutableArray array];
    }
    return self;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex
{
    UIButton *btn = btnArray[selectedIndex];
    [self didClicked :btn];
    _selectedIndex = selectedIndex;
}

- (void) didClicked :(UIButton *)sender
{
    for (UIButton *btn in btnArray) {
        btn.selected = NO;
    }
}

@end
