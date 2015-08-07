//
//  shopViewController.m
//  HighBall
//
//  Created by imac on 15-7-31.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopViewController.h"
#import "shoopHomeViewController.h"
#import "shopNaviViewController.h"
#import "shopSearchViewController.h"
#import "shopJudgeTableView.h"
@interface shopViewController ()

@end

@implementation shopViewController
#define dic(r, b, g) [UIColor colorWithRed:(r)/255.0 green:(b)/255.0 blue:(g)/255.0 alpha:1.0]
#define rgb dic(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
- (void)viewDidLoad {
    [super viewDidLoad];
    shoopHomeViewController *vc = [[shoopHomeViewController alloc]initWithNibName:@"shoopHomeViewController" bundle:nil];
    [self tarBarWithController:vc Title:@"商城首页" Image:@"iconfont-shouyeshouye.png" SelectedImage:@"iconfont-shouyeshouye_selected"];
    shopSearchViewController *searchVc = [[shopSearchViewController alloc]initWithNibName:@"shopSearchViewController" bundle:nil];
    [self tarBarWithController:searchVc Title:@"分类" Image:@"iconfont-category (1).png" SelectedImage:@"iconfont-category (1)_search.png"];
    shopJudgeTableView *shop = [[shopJudgeTableView alloc]initWithNibName:@"shopJudgeTableView" bundle:nil];
    [self tarBarWithController:shop Title:@"购物车" Image:@"iconfont-gouwuche.png" SelectedImage:@"iconfont-gouwuche_selected.png"];
    
}

- (void)tarBarWithController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *text = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    text[NSForegroundColorAttributeName] = dic(123, 123, 123);
    selectedText[NSForegroundColorAttributeName] = [UIColor grayColor];
    [vc.tabBarItem setTitleTextAttributes:text forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateNormal];
    
    shopNaviViewController *shop = [[shopNaviViewController alloc]initWithRootViewController:vc];
      [self addChildViewController:shop];
    }/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
