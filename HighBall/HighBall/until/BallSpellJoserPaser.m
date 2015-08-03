//
//  BallSpellJoserPaser.m
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "BallSpellJoserPaser.h"


@implementation BallSpellJoserPaser
//球场列表解析
+(NSMutableArray  *)paserByBallSpellDic:(NSDictionary *)dic
{
    

    NSArray *dataArr=[dic objectForKey:@"data"];
    
    NSMutableArray *ballInfos=[NSMutableArray array];
    
    for (NSDictionary *ballSpellDic in dataArr) {
        BallSpellInfo *ballInfo=[[BallSpellInfo alloc]init];
        ballInfo.courseID=[ballSpellDic objectForKey:@"courseID"];
        ballInfo.courseName=[ballSpellDic objectForKey:@"courseName"];
        ballInfo.courseIcon=[ballSpellDic objectForKey:@"courseIcon"];
        ballInfo.courseIcon=[NSString stringWithFormat:@"http://120.24.158.86/golf/data/%@",ballInfo.courseIcon];
        ballInfo.introduction=[ballSpellDic objectForKey:@"introduction"];
        ballInfo.featrue=[ballSpellDic objectForKey:@"featrue"];
        ballInfo.price=[ballSpellDic objectForKey:@"price"];
        
        ballInfo.published=[dic objectForKey:@"published"];
        [ballInfos addObject:ballInfo];
    }
    return ballInfos;
}
//球场具体信息解析
+(CourselInfo *)paserByCourselDic:(NSDictionary *)dic
{
    NSDictionary *dataDic=[dic objectForKey:@"data"];

    CourselInfo *courselInfo=[[CourselInfo alloc]init];
    courselInfo.courseID=[dataDic objectForKey:@"courseID"];
    courselInfo.courseName=[dataDic objectForKey:@"courseName"];
    courselInfo.courseIcon=[dataDic objectForKey:@"courseIcon"];
    courselInfo.courseIcon=[NSString stringWithFormat:@"http://120.24.158.86/golf/data/%@",courselInfo.courseIcon];
    courselInfo.introduction=[dataDic objectForKey:@"introduction"];
    courselInfo.featrue=[dataDic objectForKey:@"feature"];
    courselInfo.tel=[dataDic objectForKey:@"tel"];
    courselInfo.address=[dataDic objectForKey:@"address"];
        
    courselInfo.courseType=[dataDic objectForKey:@"courseType"];
    courselInfo.courseLength=[dataDic objectForKey:@"courseLength"];
    courselInfo.courseHoles=[dataDic objectForKey:@"courseHoles"];
    courselInfo.courseArea=[dataDic objectForKey:@"courseArea"];
    courselInfo.createDate=[dataDic objectForKey:@"createDate"];
    courselInfo.courseDesign=[dataDic objectForKey:@"courseDesign"];
    courselInfo.GreensGrass=[dataDic objectForKey:@"GreensGrass"];
    courselInfo.fairwayGrass=[dataDic objectForKey:@"fairwayGrass"];
    return courselInfo;
}
//解析城市
+(NSMutableArray *)paserByAddressDic:(NSDictionary *)dic
{
    NSArray *dataArr=[dic objectForKey:@"data"];
    NSMutableArray *provinces=[NSMutableArray array];
    for (NSDictionary *provinceDic in dataArr) {
        Province *province=[[Province alloc]init];
        province.provinceId=[provinceDic objectForKey:@"provinceId"];
        province.provinceName=[provinceDic objectForKey:@"provinceName"];
        
        NSArray *cities=[provinceDic objectForKey:@"cities"];
        for (NSDictionary *citiDic in cities) {
            Citie *citi=[[Citie alloc]init];
            citi.cityId=[citiDic objectForKey:@"cityId"];
            citi.cityName=[citiDic objectForKey:@"cityName"];
            [province.cities addObject:citi];
        }
        [provinces addObject:province];
    }
    return provinces;
}
//天气解析（抓包的                  ）
+(Weaterinfo *)parserByDic:(NSDictionary *)dic
{
    NSDictionary *dataDic=[dic objectForKey:@"data"];
    Weaterinfo *weaterInfo=[[Weaterinfo alloc]init];
    weaterInfo.desc=[dic objectForKey:@"desc"];
    NSArray *forecastArr=[dataDic objectForKey:@"forecast"];
    
    for (NSDictionary *dic in forecastArr) {
        Weater *w=[[Weater alloc]init];
        w.high=[dic objectForKey:@"high"];
        NSArray *highArr=[w.high componentsSeparatedByString:@"温"];
        w.high=highArr.lastObject;
        w.type=[dic objectForKey:@"type"];
        w.low=[dic objectForKey:@"low"];
        NSArray *lowArr=[w.low componentsSeparatedByString:@"温"];
        w.low=lowArr.lastObject;
        w.date=[dic objectForKey:@"date"];
        NSArray *dateArr=[w.date componentsSeparatedByString:@"日"];
        w.date=dateArr.lastObject;
        [weaterInfo.weterArr addObject:w];
    }
    return weaterInfo;
}

@end
