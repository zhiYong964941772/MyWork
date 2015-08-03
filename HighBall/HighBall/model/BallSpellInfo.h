//
//  BallSpellInfo.h
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

/*
 球场列表信息
 */

#import <Foundation/Foundation.h>

@interface BallSpellInfo : NSObject
@property(nonatomic,copy)NSString *courseID; //球场编号
@property(nonatomic,copy)NSString *courseName;//球场名称
@property(nonatomic,copy)NSString *courseIcon;//球场Icon
@property(nonatomic,copy)NSString *introduction;//球场简介
@property(nonatomic,copy)NSString *featrue;//球场特色
@property(nonatomic,copy)NSString *price;//价格
@property(nonatomic,copy)NSString *published;//发布日期
@end
