//
//  ViewController.m
//  KVO练习
//
//  Created by apple on 14/10/12.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Cat.h"

@interface ViewController ()
{
    Dog *dog;
    Cat *cat;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dog = [[Dog alloc] init];
//    cat = [[Cat alloc] init];
//    
//    [dog addObserver:cat forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
//    dog.age = 10;
    [self addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:NULL];
    self.height = 10;
    
}
- (IBAction)clicked:(id)sender {
    self.height = 11;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"YES");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
