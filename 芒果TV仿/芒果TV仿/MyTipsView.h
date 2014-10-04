//
//  MyTipsView.h
//  芒果TV仿
//
//  Created by apple on 14-10-2.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTipsView : UIView

@property (nonatomic,strong) UIImage *image;

- (void) loadData :(NSArray *)titles;

- (void) scrollTips;

@end
