//
//  BallSpellAPI.h
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//
typedef void (^MyCallBack)(id obj);
#import <Foundation/Foundation.h>

@interface BallSpellAPI : NSObject

//球场列表请求
+(void)requestByCity:(NSString*)city dateTime:(NSString*)time courseName:(NSString*)name andCallback:(MyCallBack)callback;
//球场详细请求
+(void)requestByGolfCourseID:(NSString*)courseID andCallBack:(MyCallBack)callback;
////获取协议
//+(void)requestByDelegateCourseID:(NSString *)courseID andCallback:(MyCallBack)callback;
//球场图片
+(void)requestByCourseID:(NSString*)courseID andCallBack:(MyCallBack)callback;
//球场价格
+(void)requestByCoursePriceID:(NSString*)courseID andCallback:(MyCallBack)callback;
//订单提交
+(void)sendOrdergolfCourseID:(NSString *)courseID andBookDate:(NSString *)date andBookTime:(NSString *)time andUserID:(NSString *)userID andNumberOFGroups:(NSString *)numberGroups andTotalPrice:(NSString *)price andCallback:(MyCallBack)callback;
//天气查询
+(void)requestWeatherByCity:(NSString *)city andCallback:(MyCallBack)callback;
//城市列表
+(void)requestByCitysCallBack:(MyCallBack)callback;



@end
