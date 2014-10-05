//
//  NSString+URL.m
//  MangoNetwork
//
//  Created by apple on 14-8-26.
//  Copyright (c) 2014年 戴维营教育. All rights reserved.
//

#import "NSDictionary+URL.h"
#import "Configuration.h"

@implementation NSDictionary (URL)
- (NSString *)URLString
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in self) {
        NSString *value = [self objectForKey:key];
        [array addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    kGetTodayCommend
    return [array componentsJoinedByString:@"&"];
}
@end
