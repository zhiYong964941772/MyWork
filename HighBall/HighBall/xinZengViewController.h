//
//  xinZengViewController.h
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^credentialsName)(NSString *name,NSString *phoneNum,NSString *credentials);
@interface xinZengViewController : UIViewController
@property (nonatomic,copy)credentialsName credentialsBlock;
- (void)credentialsNameWithBlock:(credentialsName)credentials;
@end
