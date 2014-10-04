//
//  MyScrollView.h
//  芒果TV仿
//
//  Created by apple on 14-10-1.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyScrollView;
@protocol MyScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfViewsInScrollView :(MyScrollView *)scrollView;
- (UIView *)viewForScrollView :(MyScrollView *)scrollView atIndexPath :(NSInteger)indexPath;

@end


@protocol MyScrollViewDelegate <NSObject>

@optional
- (void) scrollView :(MyScrollView *)scrollView didSelectIndexPathForRow :(NSInteger)indexPath;
- (void) scrollViewDidEndScroll :(MyScrollView *)scrollView;
@end


@interface MyScrollView : UIView

@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,weak) id<MyScrollViewDatasource>dataSource;
@property (nonatomic,weak) id<MyScrollViewDelegate>delegate;

- (void) reloadData;
@end
