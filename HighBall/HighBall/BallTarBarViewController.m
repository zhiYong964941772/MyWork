//
//  BallTarBarViewController.m
//  HighBall
//
//  Created by imac on 15-7-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "BallTarBarViewController.h"
#import "HomeViewController.h"
#import "BallNavigationController.h"
#import "UserViewController.h"
@interface BallTarBarViewController ()

@end

@implementation BallTarBarViewController
#define dic(r, b, g) [UIColor colorWithRed:(r)/255.0 green:(b)/255.0 blue:(g)/255.0 alpha:1.0]
#define rgb dic(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addWithController:home Title:@"首页" Image:@"tabbar_home" SelectedImage:@"tabbar_home_selected"];
    UserViewController *user = [[UserViewController alloc]init];
    [self addWithController:user Title:@"个人中心" Image:@"tabbar_profile" SelectedImage:@"tabbar_profile_selected"];
    
    
    
    
    
}
- (void)addWithController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *text = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    text[NSForegroundColorAttributeName] = dic(123, 123, 123);
    selectedText[NSForegroundColorAttributeName] = [UIColor grayColor];
    [vc.tabBarItem setTitleTextAttributes:text forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateNormal];
    
    BallNavigationController *navi = [[BallNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navi];
    
    
    
    
}

@end
