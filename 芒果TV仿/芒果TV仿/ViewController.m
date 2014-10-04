//
//  ViewController.m
//  芒果TV仿
//
//  Created by apple on 14-9-30.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"
#import "MyTipsView.h"

#define tableViewRect CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
#define navigationRightItemRect CGRectMake(0, 0, 20, 20)


static NSString *identify = @"cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,MyScrollViewDatasource,MyScrollViewDelegate>
{
    UIPageControl *pageCtrl;
    MyTipsView *tipsView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self createNavigationItem];
    
    //添加定时器来模拟数据,让tipsView滚动
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(makerTheTipsViewScroll) userInfo:nil repeats:YES];
}

- (void) makerTheTipsViewScroll
{
    [tipsView scrollTips];
}

#pragma mark 创建导航栏按钮
- (void) createNavigationItem
{
    UIImageView *leftBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavigationBarLogo.png"]];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"PlayRecordsIcoGray.png"] forState:UIControlStateNormal];
    rightBtn.frame = navigationRightItemRect;
    [rightBtn addTarget:self action:@selector(click :) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarView];
}

- (void) click :(UIButton *)sender
{
    NSLog(@"home to push!");
}

#pragma mark 创建视图
- (void) createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [self tableViewHeader];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identify];
    [self.view addSubview:tableView];
}

- (UIView *)tableViewHeader
{
    CGRect rect = self.view.frame;
    CGFloat height = 150;
    CGFloat tipHeight = 44;
    CGFloat pageHeight = 20;
    //创建返回的view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, height)];
    headerView.backgroundColor = [UIColor whiteColor];
    //创建滚动视图在tableViewHeader上
    MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    scrollView.delegate = self;
    scrollView.dataSource = self;
    [headerView addSubview:scrollView];
    //创建跑马灯
    pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, height - tipHeight - pageHeight, rect.size.width, pageHeight)];
    pageCtrl.numberOfPages = 5;
    [headerView addSubview:pageCtrl];
    
    //创建滚动的tipsView
    tipsView = [[MyTipsView alloc] initWithFrame:CGRectMake(0, height - tipHeight, rect.size.height, tipHeight)];
    [tipsView loadData:@[@"宇蝈蝈第一条测试数据" ,@"宇蝈蝈第二条测试数据" ,@"宇蝈蝈第三条测试数据"]];
    tipsView.image = [UIImage imageNamed:@"HomeActivityBarIcon.png"];
    [headerView addSubview:tipsView];
    
    return headerView;
}

#pragma mark tableViewDataSource
//1 有几个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

//2 一个section有几个row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    return cell;
}


#pragma mark tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 2) {
        return 200;
    }
    
    return 100.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section %2) {
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        view.backgroundColor = [UIColor blueColor];
        return view;
    }
    UIView *view1 = [[UIView alloc] initWithFrame:self.view.bounds];
    view1.backgroundColor = [UIColor redColor];
    return view1;
}

#pragma mark myScrollViewDatasource
- (NSInteger)numberOfViewsInScrollView :(MyScrollView *)scrollView
{
    return 5;
}

- (UIView *)viewForScrollView :(MyScrollView *)scrollView atIndexPath :(NSInteger)indexPath
{
    if (indexPath %2) {
        UIView *view0 = [[UIView alloc] initWithFrame:self.view.bounds];
        view0.backgroundColor = [UIColor purpleColor];
        return view0;
    }else{
        UIView *view1 = [[UIView alloc] initWithFrame:self.view.bounds];
        view1.backgroundColor = [UIColor grayColor];
        return view1;
    }
}

#pragma mark myScrollViewDelegate
- (void) scrollView :(MyScrollView *)scrollView didSelectIndexPathForRow :(NSInteger)indexPath
{
    NSLog(@"%ld",indexPath);
}

- (void) scrollViewDidEndScroll :(MyScrollView *)scrollView
{
    pageCtrl.currentPage = scrollView.currentPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
