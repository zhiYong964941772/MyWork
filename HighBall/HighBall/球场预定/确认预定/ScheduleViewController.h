//
//  ScheduleViewController.h
//  HighBall
//
//  Created by imac on 15-4-27.
//  Copyright (c) 2015年 YM. All rights reserved.
//

/*
 球场预定界面
 */

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <MapKit/MapKit.h>

@interface ScheduleViewController : UIViewController
{
    UITableView *_table;
//    BMKLocationService *F_locationService;
//    BMKGeoCodeSearch *_geocodesearch;
}
@property(nonatomic,strong)NSString *courselID;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *courseIcon;
@end
