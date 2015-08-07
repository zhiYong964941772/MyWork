//
//  BallSpellAPI.m
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#define weatherKey @"a88eb0df227e6036ece375f579307064"

#import "BallSpellAPI.h"
#import "AFNetworking.h"
#import "BallSpellJoserPaser.h"
#import "BallSpellPrice.h"
#import "Weaterinfo.h"


@implementation BallSpellAPI
//球场列表请求
+(void)requestByCity:(NSString *)city dateTime:(NSString *)time courseName:(NSString *)name andCallback:(MyCallBack)callback
{
    NSString *path=@"http://120.24.158.86/golf/v1/golfCourse/search";
   // NSString *path=@"http://192.168.1.11:8081/golfv2/v1/golfCourse/search";
    NSDictionary *parmas=@{@"cityID":city,@"date":time,@"courseName":name};
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager POST:path parameters:parmas success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *ballInfos=[BallSpellJoserPaser paserByBallSpellDic:dic];
        callback(ballInfos);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(0);
    }];
}
//球场详细请求
+(void)requestByGolfCourseID:(NSString *)courseID andCallBack:(MyCallBack)callback
{
    NSString *path=[NSString stringWithFormat:@"http://120.24.158.86/golf/v1/golfCourse/%@",courseID];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        CourselInfo *courselInfo=[BallSpellJoserPaser paserByCourselDic:dic];
        callback(courselInfo);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}
//球场图片
+(void)requestByCourseID:(NSString *)courseID andCallBack:(MyCallBack)callback
{
    NSString *path=[NSString stringWithFormat:@"http://120.24.158.86/golf/v1/golfCourse/%@/images",courseID];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *dataArr=[dic objectForKey:@"data"];
        NSMutableArray *imageArr=[NSMutableArray array];
        for (NSDictionary *imageDic in dataArr) {
            NSString *imageString=[imageDic objectForKey:@"courseImages"];
            NSString *imageURL=[NSString stringWithFormat:@"http://120.24.158.86/golf/data/%@",imageString];
            [imageArr addObject:imageURL];
        }
        callback(imageArr);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(0);
    }];
}
//球场价格
+(void)requestByCoursePriceID:(NSString *)courseID andCallback:(MyCallBack)callback
{
    NSString *path=[NSString stringWithFormat:@"http://120.24.158.86/golf/v1/golfCourse/%@/prices",courseID];
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *dataDic=[dic objectForKey:@"data"];
        BallSpellPrice *spellPrice=[[BallSpellPrice alloc]init];
        spellPrice.date=[dataDic objectForKey:@"publishDate"];
        spellPrice.price=[dataDic objectForKey:@"prices"];
        callback(spellPrice);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

//订单提交
+(void)sendOrdergolfCourseID:(NSString *)courseID andBookDate:(NSString *)date andBookTime:(NSString *)time andUserID:(NSString *)userID andNumberOFGroups:(NSString *)numberGroups andTotalPrice:(NSString *)price andCallback:(MyCallBack)callback
{
    NSString *path=@"http://120.24.158.86/golf/v1/golfOrder";
    NSString *params=[NSString stringWithFormat:@"golfCourseID=%@&bookDate=%@&bookTime=%@&userID=%@&numberOfGroups=%@&totalPrice=%@",courseID,date,time,userID,numberGroups,price];
    
    NSURL *url=[NSURL URLWithString:path];
    NSMutableURLRequest *reqest=[NSMutableURLRequest requestWithURL:url];
    [reqest setHTTPMethod:@"POST"];
    [reqest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@",path);
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:reqest];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSString *orderID=[dic objectForKey:@"orderID"];
        callback(orderID);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
    [operation start];
}
//天气请求
+(void)requestWeatherByCity:(NSString *)city andCallback:(MyCallBack)callback
{
    NSString *path=@"http://wthrcdn.etouch.cn/weather_mini";
    NSDictionary *parmas=@{@"city":city};
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:parmas success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        Weaterinfo *weaterInfo=[BallSpellJoserPaser parserByDic:dic];
        callback(weaterInfo);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

//城市选择
+(void)requestByCitysCallBack:(MyCallBack)callback
{
    NSString *path=@"http://120.24.158.86/golf/v1/address";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *provinces=[BallSpellJoserPaser paserByAddressDic:dic];
        NSLog(@"%@",provinces);
        callback(provinces);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}
@end
