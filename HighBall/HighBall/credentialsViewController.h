//
//  credentialsViewController.h
//  HighBall
//
//  Created by imac on 15-8-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^credentialsBlock)(NSString *credential);
@interface credentialsViewController : UIViewController
@property (nonatomic,copy)credentialsBlock blockOfcredential;

@end
