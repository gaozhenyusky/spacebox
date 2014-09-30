//
//  ViewController.m
//  TCPDemo
//
//  Created by apple on 14-9-26.
//  Copyright (c) 2014年 戴维营教育. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"
@interface ViewController () <GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *tcpClient;
    NSMutableData *respHeaderData;
    NSMutableData *respBodyData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    respHeaderData = [NSMutableData data];
    respBodyData = [NSMutableData data];
    
    tcpClient = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //git23
    //  iiaaa
    //aaa

    [tcpClient connectToHost:@"i2.mhimg.com" onPort:8088888888 error:nil];//gaoliuliu
    [ssddddddddddd]
    [ASSDASD];
    []aaa;
    //gaozhenyu

    //423432434gaoLIUgaoggggggggggggg


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    //http://i2.mhimg.com/kl688File/2013-7/2013072916185059723.jpg
    NSLog(@"connected host:%@ on port:%d", host, port);
    NSString *req = @"GET /kl688File/2013-7/2013072916185059723.jpg HTTP/1.1\r\nHOST: i2.mhimg.com\r\n\r\n\r\n";
    NSData *reqData = [req dataUsingEncoding:NSUTF8StringEncoding];
    [tcpClient writeData:reqData withTimeout:-1 tag:0];
    
    NSMutableData  *emptylineData = [NSMutableData data];
    [emptylineData appendData:[GCDAsyncSocket CRLFData]];
    [emptylineData appendData:[GCDAsyncSocket CRLFData]];
    [tcpClient readDataToData:emptylineData withTimeout:-1 maxLength:1024 tag:0];
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *recvStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"recvieved: %@", recvStr);
    if([respHeaderData length]==0)
    {
        [respHeaderData appendData:data];
    }else{
        [respBodyData appendData:data];
        [respBodyData writeToFile:@"/Users/apple/Desktop/tcphttpdown.jpg" atomically:YES];
    }
    
    
    [tcpClient readDataWithTimeout:-1 tag:0];
}

@end
