//
//  MyTipsView.m
//  芒果TV仿
//
//  Created by apple on 14-10-2.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "MyTipsView.h"


@interface MyTipsView ()
{
    UIImageView *_imageView;
    UILabel *_firstLabel;
    UILabel *_secondLabel;
    NSArray *_titlesArray;
    int _index;
}
@end

@implementation MyTipsView

- (instancetype) initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;//超出边界的子视图裁剪掉
        //喇叭形状的图形
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, frame.size.height, frame.size.height)];
        [self addSubview:_imageView];
        CGRect rect = CGRectMake(10 + frame.size.height, 0, frame.size.width - 10 -frame.size.height, frame.size.height);
        _firstLabel = [[UILabel alloc] initWithFrame:rect];
        _firstLabel.textColor = [UIColor whiteColor];
        [self addSubview:_firstLabel];
        
        //第二个label的Y值如下设置
        _secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(rect.origin.x, frame.size.height, frame.size.width, frame.size.height)];
        _secondLabel.textColor = [UIColor whiteColor];
        [self addSubview:_secondLabel];
    }
    return self;
}

- (void) setImage:(UIImage *)image
{
    //覆写image的set方法进行传值，同时封装初始化放法中imageView的image
    _image = image;
    _imageView.image = image;
}

- (void) loadData :(NSArray *)titles
{
    _titlesArray = titles;
    if (titles.count == 1) {
        _firstLabel.text = titles[0];
        _secondLabel.text = titles[0];
    }else{
        _firstLabel.text = titles[0];
        _secondLabel.text = titles[1];
        
        _index = 1;
    }
}

- (void)scrollTips
{
    [UIView animateWithDuration:2.0 animations:^{
        //保存firstLabel的位置
        CGRect rect = _firstLabel.frame;
        //将secondLabel移动到firstLabel的位置，取代firstLabel
        _secondLabel.frame = rect;
        
        rect.origin.y = -rect.size.height;
        //将firstLabel移动到横幅上面
        _firstLabel.frame = rect;
    } completion:^(BOOL finished) {
        //保存firstLabel的位置
        CGRect rect = _firstLabel.frame;
        rect.origin.y = rect.size.height;
        
        //将firstLabel移动到横幅下面
        _firstLabel.frame = rect;
        
        //交换firstLabel和secondLabel所指向的对象
        UILabel *tmp = _firstLabel;
        _firstLabel = _secondLabel;
        _secondLabel = tmp;
        
        _index ++;
        if (_index == _titlesArray.count) {
            _index = 0;
        }
        
        _secondLabel.text = _titlesArray[_index];
    }];
}


@end
