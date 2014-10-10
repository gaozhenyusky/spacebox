//
//  ViewController.m
//  XMPPDemoZhenyuGao
//
//  Created by apple on 14/10/8.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//
#import "AppDelegate.h"
#import "Configure.h"
#import "ViewController.h"
#import "ChatViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)login:(id)sender {
    [[self appdelegate] disconnect];
    if (_username.text.length >0 && _password.text.length >0) {
        [[NSUserDefaults standardUserDefaults] setObject:[_username.text stringByAppendingString:@"@vpn.wuqiong.tk"] forKey:USERID];
        [[NSUserDefaults standardUserDefaults] setObject:_password.text forKey:PASS];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[self appdelegate] connect];
}

- (IBAction)registe:(id)sender {
    [[self appdelegate] disconnect];
    if (_username.text.length >0 && _password.text.length >0) {
        [[NSUserDefaults standardUserDefaults] setObject:[_username.text stringByAppendingString:@"@vpn.wuqiong.tk"] forKey:USERID];
        [[NSUserDefaults standardUserDefaults] setObject:_password.text forKey:PASS];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[self appdelegate] gotoRegister];
}

- (AppDelegate *)appdelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
