//
//  xinZengViewController.h
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^xinZengs)(NSString *name,NSString *phone);
@interface xinZengViewController : UIViewController
@property (nonatomic,copy)xinZengs nameAndPhone;

@end
