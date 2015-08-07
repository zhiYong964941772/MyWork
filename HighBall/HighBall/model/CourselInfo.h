//
//  CourselInfo.h
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

/*
 球场具体信息
 */

#import <Foundation/Foundation.h>

@interface CourselInfo : NSObject
@property(nonatomic,copy)NSString *courseID;//球场编号
@property(nonatomic,copy)NSString *courseName;//球场名称
@property(nonatomic,copy)NSString *courseIcon;//球场ICON
@property(nonatomic,copy)NSString *introduction;//球场简介
@property(nonatomic,copy)NSString *featrue;//球场特色
@property(nonatomic,copy)NSString *tel;//电话
@property(nonatomic,copy)NSString *address;//位置

@property(nonatomic,copy)NSString *courseType;//球场参数
@property(nonatomic,copy)NSString *courseLength;//球场长度
@property(nonatomic,copy)NSString *courseHoles;//球场洞数
@property(nonatomic,copy)NSString *courseArea;//球场面积
@property(nonatomic,copy)NSString *createDate;//球场成立日期
@property(nonatomic,copy)NSString *courseDesign;//球场设计公司

@property(nonatomic,copy)NSString *GreensGrass;//果岭草种
@property(nonatomic,copy)NSString *fairwayGrass;//球道草种

@end
