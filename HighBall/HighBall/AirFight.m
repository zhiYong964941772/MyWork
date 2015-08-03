//
//  AirFight.m
//  HighBall
//
//  Created by imac on 15-7-28.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirFight.h"
#import "AirTime.h"
@implementation AirFight
static NSArray *_allFight = nil;
+(NSArray *)allFight{
    if (!_allFight) {
        _allFight = [[self alloc]getWithFight:@"alternative.plist"];
    }
    return _allFight;
}
-(NSArray *)getWithFight:(NSString *)file{
    NSString *plist = [[NSBundle mainBundle]pathForResource:file ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:plist];
    NSMutableArray *arrays = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        AirTime *time = [[AirTime alloc]init];
        [time setValuesForKeysWithDictionary:dic];
        [arrays addObject:time];
    
    }
    
   
    return [arrays copy];
    
}


@end
