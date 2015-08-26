//
//  ziYuanViewController.h
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^labelName)(NSString *hao,NSString *cha,NSString *dan);

@interface ziYuanViewController : UIViewController
@property (nonatomic,copy)labelName blockLabel;

+ (void)initWithLabel:(labelName)blockLabel;

@end
