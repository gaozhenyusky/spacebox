//
//  ViewController.m
//  GCD联系
//
//  Created by apple on 14/10/6.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 并发队列

- (IBAction)didClicked:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queque = dispatch_get_main_queue();
    dispatch_async(globalQueue, ^{
    
        NSLog(@"%@",[NSThread isMainThread]?@"yes":@"no2");
        for (int i = 1; i < 100; i++) {
//            _number.text = @"success";
            dispatch_async(queque, ^{
                NSLog(@"%@",[NSThread isMainThread]?@"yes1":@"no");
                _number.text = @"success";
            });
        }
    });

    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
    dispatch_after(popTime, globalQueue, ^{
        NSLog(@"2s的延迟");
    });
}

#pragma mark 串行队列

- (IBAction)didClicked2:(id)sender {
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t userQueue = dispatch_queue_create("gao", NULL);
    dispatch_async(userQueue, ^{
        for (int i = 1; i < 100; i++){
            NSLog(@"第一个%d",i);
        }
    });
    
    dispatch_async(userQueue, ^{
        for (int m = 1; m <100; m++) {
            NSLog(@"第二个%d",m);
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
