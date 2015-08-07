//
//  HomeViewController.h
//  HighBall
//
//  Created by imac on 15-6-30.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface HomeViewController : UIViewController<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,UITableViewDataSource,UITableViewDelegate>
{
    BMKGeoCodeSearch *_geoSearch;//百度的反地理编码
    BMKLocationService *_locaService;//
}


@end
