//
//  phoneViewController.m
//  HighBall
//
//  Created by imac on 15-9-2.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "phoneViewController.h"
#import "UIView+Extension.h"
#import "UILabel+getLabel.h"
#import "UIButton+button.h"
#define UIFrame [[UIScreen mainScreen]bounds]
@interface phoneViewController()
@property (nonatomic,strong)UIView *phoneView;
@property (nonatomic,strong)UIImageView *imageView;


@end
@implementation phoneViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self viewOfPhone];
     [self viewOfFoot];
    
    
}
- (void)viewOfFoot{
    self.view.frame = UIFrame;
    /**
     在主视里添加视图，如果在视图上再添加控件，那么就要计算好控件的位置，他是相对于主视图的bounds基于视图上布置的
     */
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor = [UIColor whiteColor];
    footView.width = UIFrame.size.width-40;
    footView.height = UIFrame.size.height/2-120;
    footView.centerX = self.view.center.x;
    footView.y = self.imageView.y + 30;
    footView.layer.borderWidth = 1;
    footView.layer.borderColor = [[UIColor grayColor]CGColor];
    
    CGFloat cx = self.view.center.x;
    
    
    UILabel *phoneLabel = [[UILabel alloc]ofLabelWithX:footView.centerX/2 WithY:25 WithWidth:150 WithHeight:40 WithFont:18 WithColor:nil WithText:@"一键预定独家行程"];
    phoneLabel.centerX = cx-20;
    phoneLabel.backgroundColor = [UIColor whiteColor];
    [footView addSubview:phoneLabel];

    UILabel *label = [[UILabel alloc]ofLabelWithX:footView.centerX-50 WithY:phoneLabel.height+phoneLabel.y+20 WithWidth:150 WithHeight:20 WithFont:18 WithColor:nil WithText:@"多重平台快捷服务"];
    label.centerX = cx-20;
    
    [footView addSubview:label];
    
    UILabel *workTime = [[UILabel alloc]ofLabelWithX:0 WithY:label.height+20+label.y WithWidth:150 WithHeight:20 WithFont:18 WithColor:nil WithText:@"专业团队出行无忧"];
    workTime.centerX = cx-20;
    NSLog(@"%f",workTime.centerX);
    
    [footView addSubview:workTime];
    
    [self.view addSubview:footView];

    
    
    
}
- (void)viewOfPhone{
    self.view.frame = UIFrame;
    /**
     在主视里添加视图，如果在视图上再添加控件，那么就要计算好控件的位置，他是相对于主视图的bounds基于视图上布置的
     */
    UIView *phoneView = [[UIView alloc]init];
    self.phoneView = phoneView;
    phoneView.backgroundColor = [UIColor whiteColor];
    phoneView.width = UIFrame.size.width-40;
    phoneView.height = UIFrame.size.height/2-100;
    phoneView.centerX = self.view.center.x;
    phoneView.y = 20;
    phoneView.layer.borderWidth = 1;
    phoneView.layer.borderColor = [[UIColor grayColor]CGColor];

    CGFloat cx = self.view.center.x;
    
    
    UILabel *phoneLabel = [[UILabel alloc]ofLabelWithX:phoneView.centerX/2 WithY:30 WithWidth:120 WithHeight:40 WithFont:15 WithColor:nil WithText:@"高球秘书，竭尽全力为您服务"];
    phoneLabel.centerX = cx-20;
    phoneLabel.backgroundColor = [UIColor whiteColor];
    [phoneView addSubview:phoneLabel];

    
    UIButton *phoneButton = [[UIButton alloc]buttonWithBackGroundImage:@"iconfont-yijianbohao.png" HighlightedImage:@"iconfont-yijianbohao (1).png" WithTitle:@"" WithAction:@selector(phone) Targget:self WithBackGroundColor:[UIColor clearColor] WithX:phoneView.centerX-40 WithY:phoneView.centerY-40 WithWidth:40 WithHeight:40];
    phoneButton.centerX = cx-20 ;
        [phoneView addSubview:phoneButton];
    
    UILabel *label = [[UILabel alloc]ofLabelWithX:phoneView.centerX-50 WithY:phoneView.height - 50 WithWidth:100 WithHeight:10 WithFont:10 WithColor:[UIColor orangeColor] WithText:@"一键拨打客服电话"];
    label.centerX = cx-20;
   
    [phoneView addSubview:label];
    
    UILabel *workTime = [[UILabel alloc]ofLabelWithX:0 WithY:label.y+20 WithWidth:100 WithHeight:10 WithFont:10 WithColor:[UIColor grayColor] WithText:@"工作时间7:00－18:00"];
    workTime.centerX = cx-20;
    NSLog(@"%f",workTime.centerX);
    
    [phoneView addSubview:workTime];
    UIImageView *image = [[UIImageView alloc]init];
    image.backgroundColor = [UIColor grayColor];
    image.frame = CGRectMake(20, phoneView.x+phoneView.height +30, phoneView.width, 1);
    self.imageView = image;
    [self.view addSubview:phoneView];
    [self.view addSubview:image];
}
- (void)phone{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:15521301050"]];
    NSLog(@"正在为您转接，请稍后。。。");
    
    
}
@end
