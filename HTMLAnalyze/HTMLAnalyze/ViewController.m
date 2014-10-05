//
//  ViewController.m
//  HTMLAnalyze
//
//  Created by apple on 14/10/5.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "ViewController.h"
#import "HTMLNode.h"
#import "HTMLParser.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *URLStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://photo.firefox.news.cn/14/1004/21/KWNSQ2JAZGDOF7U3.html"] encoding:NSUTF8StringEncoding error:nil];
//    HTMLParser *parser = [[HTMLParser alloc] initWithString:URLStr error:nil];
//    HTMLNode *node = [parser body];
//    NSArray *nodeArray = [node findChildrenWithAttribute:@"class" matchingName:@"article_content" allowPartial:YES];
//    for (HTMLNode *n in nodeArray) {
//        NSLog(@"%@",[n children]);
//        HTMLNode *new = [n findChildTag:@"div"];
//        NSArray *next = [new findChildTags:@"p"];
//        HTMLNode *l = next[1];
//        NSString *str = [l contents];
////        for (HTMLNode *n in next) {
////            NSLog(@"%@",[n contents]);
////        }
//        NSLog(@"%@",str);
//    }
    
    
    
    
    NSString *URLStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://game.feng.com/game/infoDetail/2014-10-05/The_name_super_wonderful_escape_game_ADAM_forthcoming_83023.shtml"] encoding:NSUTF8StringEncoding error:nil];
    HTMLParser *parser = [[HTMLParser alloc] initWithString:URLStr error:nil];
    HTMLNode *node = [parser body];
    NSArray *article_mainArray = [node findChildrenWithAttribute:@"style" matchingName:@"color: rgb(17, 17, 17); line-height: 31.111112594604492px; background-color: rgb(254, 254, 254);" allowPartial:YES];

    for (HTMLNode *a in article_mainArray) {
        
        NSLog(@"%@",[a contents]);

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
