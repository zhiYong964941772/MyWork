//
//  city.m
//  HighBall
//
//  Created by imac on 15-7-23.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "city.h"

@implementation city
static NSArray *_allcity = nil;
+ (NSArray *)allCity{
    if (!_allcity) {
        _allcity = [[self alloc]getAndParseCategoyFile:@"city.plist"];
    }
    
    return _allcity;
}
- (NSArray *)getAndParseCategoyFile:(NSString *)file{
    NSString *city = [[NSBundle mainBundle]pathForResource:file ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:city ];
    NSMutableArray *cityAll = [NSMutableArray array];
    for (NSString *strCity in dic) {
        [cityAll addObject:strCity];
    }
    return [cityAll copy];
}

@end
