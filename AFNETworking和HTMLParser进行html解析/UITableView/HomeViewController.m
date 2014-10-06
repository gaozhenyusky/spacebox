//
//  HomeViewController.m
//  UITableView
//
//  Created by apple on 14-10-5.
//  Copyright (c) 2014年 diveinedu. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"
#import "HTMLNode.h"
#import "HTMLParser.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *homeTableView;
    UIView *topView;
    AFHTTPRequestOperation *httpRequest;
    AFHTTPSessionManager *manager;

}

@end

@implementation HomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma 必须实现的两个方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}



#pragma 创建tableview
-(void)createTableView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, height/9,width,height-height/9 ) style:UITableViewStylePlain];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    [self.view addSubview:homeTableView];
    homeTableView.tableHeaderView = [self createHeaderTitle];
}

#pragma 设置顶栏
-(void)createTopView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height/9)];
    topView.backgroundColor = [UIColor colorWithRed:68/255.0 green:175/255.0 blue:150/255.0 alpha:1];
    [self.view addSubview:topView];
    
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(5, 20, 30, 30);
    [listBtn setImage:[UIImage imageNamed:@"ic_nav"] forState:UIControlStateNormal];
    [listBtn addTarget:self action:@selector(didlist) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview: listBtn];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(width/2-30, 10, 200, height/8-10)];
    lable.text = @"瓜子";
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:30];
    [topView addSubview:lable];
}

#pragma tableView头部

- (UIView *)createHeaderTitle
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 50)];

    return headerView;
}

-(void)didlist
{

    NSLog(@"list!!!");
}

#pragma 豆瓣数据解析

-(void)datamanager
{
    NSString *path = @"http://auto.firefox.news.cn/14/1004/09/PI1FYJQGR9LCVOAE.html";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    httpRequest = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    
#warning 第一种方法 HTMLParser
    NSString *URLStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:path] encoding:NSUTF8StringEncoding error:nil];
    HTMLParser *parser = [[HTMLParser alloc] initWithString:URLStr error:nil];
    HTMLNode *node = [parser body];
    NSArray *pin= [node findChildrenWithAttribute:@"class" matchingName:@"article_content" allowPartial:YES];
    for (HTMLNode *n in pin) {
        HTMLNode *new = [n findChildTag:@"div"];
        NSArray *destArray = [new findChildTags:@"p"];
        for (HTMLNode *destNode in destArray) {
            NSLog(@"%@",[destNode contents]);
        }
    }
    
    
#warning 第二种方法 AFHTTPRequestOperation
    [httpRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    NSError *error;
        HTMLParser *parser = [[HTMLParser alloc] initWithData:responseObject error:&error];
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        HTMLNode *node = [parser body];

        NSArray *pin= [node findChildrenWithAttribute:@"class" matchingName:@"article_content" allowPartial:YES];
        NSLog(@"%@",pin);
        for (HTMLNode *n in pin) {
            HTMLNode *new = [n findChildTag:@"div"];
            NSArray *destArray = [new findChildTags:@"p"];
            for (HTMLNode *destNode in destArray) {
                NSLog(@"%@",[destNode contents]);
            }
        }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error);
  }];
    
    [httpRequest start];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTableView];
    [self createTopView];
    [self createHeaderTitle];
    [self datamanager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
