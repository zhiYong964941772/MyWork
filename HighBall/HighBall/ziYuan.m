//
//  ziYuan.m
//  HighBall
//
//  Created by imac on 15-8-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ziYuan.h"
#import "JKAlertDialog.h"
#import "ziYuanViewController.h"
#import "dingDanViewController.h"
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define Frame [[UIScreen mainScreen]bounds]

@implementation ziYuan
static NSInteger num = 1;
static NSInteger mon = 200;
static NSInteger num1;
static NSInteger num2;
static NSInteger num3;
static NSInteger num4;
static NSInteger num5;
static NSInteger num6;
static NSInteger num7;
static NSInteger num8;
- (UILabel *)money{
    if (!_money) {
        _money = [[UILabel alloc]initWithFrame:CGRectMake(55, 15, 150, 40)];
        self.money.textColor = [UIColor whiteColor];
        self.money.font = [UIFont systemFontOfSize:22];
    }
    return _money;

}
- (void)show:(NSInteger)money andHeaderName:(NSString *)name{
    self.backgroundColor = Color(249, 57, 28);
   self.frame = CGRectMake(0, Frame.size.height - 124, Frame.size.width, 60);
    //接收事件
    self.money.text = [NSString stringWithFormat:@"¥ %d",money];
    num7 = money;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(num:) name:@"numOfziYuan" object:nil];
    self.name = name;
    [self initWithFootView:self];
}
- (void)num:(NSNotification *)notification{
    num1 = [notification.userInfo[@"num1"]integerValue];
     num2 = [notification.userInfo[@"num2"]integerValue];
     num3 = [notification.userInfo[@"num3"]integerValue];
    if (num1>=0||num2>=0||num3>=0) {
        num4 = num1*mon;
        num5 = num2*mon;
        num6 = num3*mon;
    }
    num8 = num4+num5+num6;
    
    self.money.text = [NSString stringWithFormat:@"¥ %d",(num4+num5+num6+num7)];
    
}

- (void)initWithFootView:(UIView *)footView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 80, 40)];
    self.zong = label;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"总额：";
    [footView addSubview:label];
    
    /**
     金额变化
     */
    
    
    
    
    [footView addSubview:self.money];
    
    /**
     *  商品清单的显示按钮
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     btn.frame = CGRectMake(self.money.frame.origin.x+70, 20, 40, 30);
    [btn setTitle:@"明细" forState:UIControlStateNormal];
    btn.userInteractionEnabled = YES;
    [btn addTarget:self action:@selector(mingxi) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.origin.x+2,btn.frame.origin.y+btn.frame.size.height-5 , btn.frame.size.width-2, 1)];
    imageView.backgroundColor = [UIColor whiteColor];
    [footView addSubview:imageView];
    
    
    
    /**
     x下一步
     */
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(footView.frame.size.width-130, 0, 80, footView.frame.size.height)];
    label3.backgroundColor = Color(249, 98, 30);
    label3.text = @"下一步";
    label3.font = [UIFont systemFontOfSize:17];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor whiteColor];
    [footView addSubview:label3];
    NSLog(@"%@",self.name);
    if ([self.name isEqualToString:@"选择资源"]) {
        
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(label3.frame.origin.x +label3.frame.size.width, 0, 80, footView.frame.size.height)];
    label4.textColor = [UIColor whiteColor];
    label4.text = @"提交订单";
    label4.font = [UIFont systemFontOfSize:12];
    label4.backgroundColor = Color(249, 98, 30);
    [footView addSubview:label4];
    }else{
        
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(label3.frame.origin.x +label3.frame.size.width, 0, 80, footView.frame.size.height)];
        label4.textColor = [UIColor whiteColor];
        label4.text = @"去支付";
        label4.font = [UIFont systemFontOfSize:12];
        label4.backgroundColor = Color(249, 98, 30);
        [footView addSubview:label4];
        
        
    }
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(label3.frame.origin.x, 0, 170, footView.frame.size.height);
    [btn2 addTarget:self action:@selector(xiayibu) forControlEvents:UIControlEventTouchUpInside];
    btn2.userInteractionEnabled = YES;
    [footView addSubview:btn2];
    
    
    
}
- (void)mingxi{
    
    
    
    UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Frame.size.width-120, 320)];
    alertView.backgroundColor = [UIColor clearColor];
    UILabel *feiLabel = [[UILabel alloc]initWithFrame:CGRectMake(-20, 10, 120, 40)];
    feiLabel.text = @"费用明细";
    feiLabel.font = [UIFont systemFontOfSize:20];
    [alertView addSubview:feiLabel];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-25, 55, alertView.frame.size.width+50, 1)];
    imageView.backgroundColor = [UIColor grayColor];
    [alertView addSubview:imageView];
    UILabel *foolMoney = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.origin.y+10, 100, 30)];
    foolMoney.text = @"基本团费";
    foolMoney.font = [UIFont systemFontOfSize:20];
    [alertView addSubview:foolMoney];
    UILabel *chengLabel = [[UILabel alloc]initWithFrame:CGRectMake(foolMoney.frame.origin.x, foolMoney.frame.size.height +foolMoney.frame.origin.y+10, 100, 30)];
    chengLabel.text = @"成人";
    chengLabel.font = [UIFont systemFontOfSize:20];
    [alertView addSubview:chengLabel];
    UILabel *feiLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-100, chengLabel.frame.origin.y-5, 100, 40)];
    feiLabel2.text = [NSString stringWithFormat:@"¥ %ld",(long)mon];
    feiLabel2.textColor = [UIColor orangeColor];
    [alertView addSubview:feiLabel2];
    UILabel *shuLabel = [[UILabel alloc]initWithFrame:CGRectMake(feiLabel2.frame.origin.x+50, feiLabel2.frame.origin.y, 50, 40)];
    shuLabel.text = [NSString stringWithFormat:@"/人x%ld",(long)num];
    shuLabel.font = [UIFont systemFontOfSize:15];
    [alertView addSubview:shuLabel];
    
    
    
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(-25, chengLabel.frame.origin.y+chengLabel.frame.size.height+10, alertView.frame.size.width+50, 1)];
    imageView2.backgroundColor = [UIColor grayColor];
    [alertView addSubview:imageView2];
    
   
    UILabel *fujialabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView2.frame.origin.y+10, 100, 30)];
    fujialabel.font = [UIFont systemFontOfSize:20];
    fujialabel.text = @"附加费";
    [alertView addSubview:fujialabel];
    UILabel *fujiaLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-70, fujialabel.frame.origin.y,70 , 30)];
    fujiaLabel2.text = [NSString stringWithFormat:@"¥ %d",num8];
    fujiaLabel2.textColor = [UIColor orangeColor];
    [alertView addSubview:fujiaLabel2];
    
    self.haoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, fujialabel.frame.origin.y+fujialabel.frame.size.height+10, 200,30 )];
    self.haoLabel.numberOfLines = 0;
        self.haoLabel.font = [UIFont systemFontOfSize:17];
    [alertView addSubview:self.haoLabel];
    
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-40, self.haoLabel.frame.origin.y, 40, 30)];
    numLabel.text = [NSString stringWithFormat:@"%d 人",num1];
    [alertView addSubview:numLabel];
    
    self.chaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,self.haoLabel.frame.origin.y+10+self.haoLabel.frame.size.height , 200, 30)];
    self.chaLabel.numberOfLines = 0;
    
    self.chaLabel.font = [UIFont systemFontOfSize:17];
    [alertView addSubview:self.chaLabel];

    UILabel *numLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-40, self.chaLabel.frame.origin.y, 40, 30)];
    numLabel2.text = [NSString stringWithFormat:@"%d 人",num2];
    [alertView addSubview:numLabel2];
    
    
    self.danLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.chaLabel.frame.origin.y+10+self.chaLabel.frame.size.height,200 , 30)];
    self.danLabel.numberOfLines = 0;
    //self.danLabel.text = @"12345";
    self.danLabel.font = [UIFont systemFontOfSize:17];
    [alertView addSubview:self.danLabel];
    
    UILabel *numLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-40, self.danLabel.frame.origin.y, 40, 30)];
    numLabel3.text = [NSString stringWithFormat:@"%d 人",num3];
    [alertView addSubview:numLabel3];
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(-25, self.danLabel.frame.origin.y+self.danLabel.frame.size.height+10, alertView.frame.size.width+50, 1)];
    imageView3.backgroundColor = [UIColor grayColor];
    [alertView addSubview:imageView3];
    
    UILabel *zongLabel = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-60, imageView3.frame.origin.y+imageView3.frame.size.height+10, 60, 30)];
    zongLabel.text = self.money.text;
    zongLabel.textColor = [UIColor orangeColor];
    zongLabel.font = [UIFont systemFontOfSize:17];
    [alertView addSubview:zongLabel];
    UILabel *zongLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-150, imageView3.frame.origin.y+imageView3.frame.size.height+10, 140, 30)];
    zongLabel2.text = @"订单总额：";
    
    zongLabel2.font = [UIFont systemFontOfSize:20];
    [alertView addSubview:zongLabel2];
    [ziYuanViewController initWithLabel:^(NSString *hao, NSString *cha, NSString *dan) {
        self.haoLabel.text = hao;
        self.chaLabel.text = cha;
        self.danLabel.text = dan;
        
    }];
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithName:@"" message:@"" color:[UIColor whiteColor] andBoolen:YES AlertsWidth:alertView.frame.size.width AlertsHeight:alertView.frame.size.height];
    alert.shopView = alertView;
    [alert show];
}
- (void)xiayibu{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.money.text forKey:@"money2"];
    if ([self.name isEqualToString:@"选择资源"]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ziYuan123" object:nil];
    }else {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"dingDan123" object:nil];
}
    
    
    
    [defaults synchronize];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"numOfziYuan" object:nil];
}

@end
