//
//  BallTarBarViewController.h
//  HighBall
//
//  Created by imac on 15-7-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BallTarBarViewController : UITabBarController
- (void)addWithController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage;
@end
