//
//  AirTicketViewController.h
//  HighBall
//
//  Created by imac on 15-7-9.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AirTicketViewController;
@protocol airCitydelegate <NSObject>

@optional
- (void)cityWithName:(NSString *)name Entrust:(AirTicketViewController *)entrust;
@end
@interface AirTicketViewController : UIViewController
@property (nonatomic,weak)id<airCitydelegate>delegate;
@end
