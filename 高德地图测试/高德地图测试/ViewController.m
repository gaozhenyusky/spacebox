//
//  ViewController.m
//  高德地图测试
//
//  Created by admin on 14-10-9.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UserLocationViewController.h"
@interface ViewController ()
@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initMapView];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 200, 200);
    [btn setTitle:@"定位" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)initMapView
{
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
}

- (void)btnClick:(UIButton *)sender {
    UserLocationViewController *ULVC = [[UserLocationViewController alloc] init];
    ULVC.mapView = self.mapView;
    [self.navigationController pushViewController:ULVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
