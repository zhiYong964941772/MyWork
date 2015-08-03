//
//  BallSpellScheduleViewController.h
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

/*
 球场预定页面，可根据自己的选择，（城市，日期，名称）来进行查询
 */

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface BallSpellScheduleViewController : UIViewController<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>{
    BMKGeoCodeSearch *_geoSearch;
    BMKLocationService *_locaService;
}

@end
