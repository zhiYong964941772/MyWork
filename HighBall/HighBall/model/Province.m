//
//  Province.m
//  HighBall
//
//  Created by imac on 15-5-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "Province.h"

@implementation Province

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.cities=[NSMutableArray array];
    }
    return self;
}

@end
