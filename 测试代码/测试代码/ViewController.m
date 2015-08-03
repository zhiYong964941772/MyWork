//
//  ViewController.m
//  测试代码
//
//  Created by imac on 15-8-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+button.h"
#import "UIView+Extension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = [[UIScreen mainScreen]bounds];
    UIView *tarView = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 50, frame.size.width,50)];
    tarView.backgroundColor = [UIColor grayColor];
    UIButton *lovebtn = [UIButton buttonWithTitle:@"关注" Image:[UIImage imageNamed:@"iconfont-guanzhu.png"] HighlightedImage:[UIImage imageNamed:@"iconfont-guanzhu.png"] NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor]];
    UIButton *shopbtn = [UIButton buttonWithTitle:@"购物车" Image:[UIImage imageNamed:@"gouwuche.png"] HighlightedImage:[UIImage imageNamed:@"gouwuche.png"] NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor]];
    UIButton *pullShop = [UIButton buttonWithTitle:@"加入购物车" Image:nil HighlightedImage:nil NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor]];
    lovebtn.x = 0;
    lovebtn.y = 0;
    shopbtn.x = 110;
    shopbtn.y = 0;
    pullShop.x = 220;
    pullShop.y = 0;
    lovebtn.width = 110;
    lovebtn.height = 50;
    shopbtn.width = 110;
    shopbtn.height = 50;
    pullShop.width = 160;
    pullShop.height = 50;
    [tarView addSubview:lovebtn];
    [tarView addSubview:shopbtn];
    [tarView addSubview:pullShop];
    [self.view addSubview:tarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
