//
//  ViewController.m
//  KVOApp
//
//  Created by apple on 14-8-26.
//  Copyright (c) 2014年 戴维营教育. All rights reserved.
//

#import "ViewController.h"

#import "Student.h"
#import "Teacher.h"

@interface ViewController ()
{
    Student *stu1;
    Student *stu2;
    
    Teacher *t;
}

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    stu1 = [[Student alloc] init];
    stu2 = [[Student alloc] init];
    
    t = [[Teacher alloc] init];
    [t addObserver:stu1 forKeyPath:@"questions" options:NSKeyValueObservingOptionNew context:NULL];
    [t addObserver:stu2 forKeyPath:@"questions" options:NSKeyValueObservingOptionNew context:NULL];
    
    t.questions = 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
