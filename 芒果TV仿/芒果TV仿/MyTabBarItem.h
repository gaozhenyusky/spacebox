//
//  MyTabBarItem.h
//  芒果TV仿
//
//  Created by apple on 14-10-4.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarItem : UIView

@property (nonatomic ,strong) UIImage *image;
@property (nonatomic , copy)NSString *title;
@property (nonatomic ,strong) UIImage *selectedImage;

- (id)initWithImage :(UIImage *)image title :(NSString *)title;
@end
