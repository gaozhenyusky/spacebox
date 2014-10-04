//
//  MyScrollView.m
//  芒果TV仿
//
//  Created by apple on 14-10-1.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "MyScrollView.h"
@interface MyScrollView()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}

@end

@implementation MyScrollView
@synthesize currentPage = _currentPage;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;//垂直滚动
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap :)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void) didTap :(UITapGestureRecognizer *)recognizer
{
    //仅当_delegate存在且响应scrollView的点击方法时
    if (_delegate && [_delegate respondsToSelector:@selector(scrollView:didSelectIndexPathForRow:)]) {
        //index为偏移量与屏幕总长度的比值，这里取整数
        NSInteger index = _scrollView.contentOffset.x/self.bounds.size.width;
        //执行代理方法
        [_delegate scrollView:self didSelectIndexPathForRow:index];
    }
}

- (void) setDataSource:(id<MyScrollViewDatasource>)dataSource
{
    //通过重写dataSource的代理方法,将数据传递给接口,这样三方类调用此接口的时候即可刷新数据
    _dataSource = dataSource;
    [self reloadData];
}

- (void) reloadData
{
    //先执行全部清理的方法
    [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger count = [_dataSource numberOfViewsInScrollView:self];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    _scrollView.contentSize = CGSizeMake(width *count, height);
    //然后遍历全部的view 这就是刷新
    for (NSInteger i = 0; i < count; i++) {
        UIView *view = [_dataSource viewForScrollView:self atIndexPath:i];
        view.frame = CGRectMake(i *width, 0, width, height);
        [_scrollView addSubview:view];

    }
    
}

//对currentPage的get和set方法进行重写
- (NSInteger) currentPage
{
    return _scrollView.contentOffset.x/_scrollView.frame.size.width;
}

- (void) setCurrentPage:(NSInteger)currentPage
{
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width *currentPage, 0);
    _currentPage = currentPage;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //结束拖拽scrollView之前的减速判断
    if (!decelerate) {
        if (_delegate && [_delegate respondsToSelector:@selector(scrollViewDidEndScroll:)]) {
            [_delegate scrollViewDidEndScroll:self];
        }
    }
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //到哪个界面停止了
    if (_delegate && [_delegate respondsToSelector:@selector(scrollViewDidEndScroll:)]) {
        [_delegate scrollViewDidEndScroll:self];
    }
    
}

//- (void) layoutSubviews
//{
//    [super layoutSubviews];
//
//}

@end























