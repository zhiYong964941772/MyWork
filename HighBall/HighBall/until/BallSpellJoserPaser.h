//
//  BallSpellJoserPaser.h
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BallSpellInfo.h"
#import "CourselInfo.h"
#import "Province.h"
#import "Citie.h"
#import "Weaterinfo.h"
#import "Weater.h"



@interface BallSpellJoserPaser : NSObject
//解析球场列表
+(NSMutableArray *)paserByBallSpellDic:(NSDictionary*)dic;
//解析球场信息
+(CourselInfo *)paserByCourselDic:(NSDictionary *)dic;
//解析城市
+(NSMutableArray *)paserByAddressDic:(NSDictionary *)dic;
//解析天气
+(Weaterinfo *)parserByDic:(NSDictionary *)dic;


@end
