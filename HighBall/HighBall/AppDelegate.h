//
//  AppDelegate.h
//  HighBall
//
//  Created by imac on 15-4-22.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,BMKGeneralDelegate>
{
    BMKMapManager *_manager;
}
@property (strong, nonatomic) UIWindow *window;


@end

