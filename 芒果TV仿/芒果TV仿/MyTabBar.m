//
//  MyTabBar.m
//  芒果TV仿
//
//  Created by apple on 14-10-4.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarItem.h"

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
    sender.selected = YES;
    
    if (_delegate && [_delegate respondsToSelector:@selector(myTabBar:selectAtIndex:)]) {
        [_delegate myTabBar:self selectAtIndex:sender.tag];
    }
}

- (void) setBackgroundImage:(UIImage *)backgroundImage
{
    bgView.image = backgroundImage;
    _backgroundImage = backgroundImage;
}

- (void) setItems:(NSArray *)items
{
    CGFloat width = self.frame.size.width / items.count;
    
    for (int i = 0; i < items.count; i++) {
        MyTabBarItem *item = [items objectAtIndex:i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(i * width, 0, width, self.frame.size.height);
        btn.tag = i;
        [self addSubview:btn];
        
        [btnArray addObject:btn];
    }
    
    _items = [items copy];
}













@end
