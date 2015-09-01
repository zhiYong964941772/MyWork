//
//  foolView.m
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//


#import "foolView.h"
#import "JKAlertDialog.h"

#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define Frame [[UIScreen mainScreen]bounds]
@interface foolView()
@property (nonatomic,strong)UILabel *zong;
@property (nonatomic,assign)NSInteger nums;

@end
@implementation foolView


static NSInteger num = 1;

static NSInteger mon = 200;

- (UILabel *)money{
    if (!_money) {
        _money = [[UILabel alloc]initWithFrame:CGRectMake(55, 15, 150, 40)];
        self.money.textColor = [UIColor whiteColor];
        self.money.font = [UIFont systemFontOfSize:22];
    }
    return _money;
}
-(void)show:(NSString *)money{
    self.backgroundColor = Color(249, 57, 28);
    self.frame = CGRectMake(0, Frame.size.height - 124, Frame.size.width, 60);
    //接收事件
    self.money.text = [NSString stringWithFormat:@"¥ %@",money];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(num:) name:@"num" object:nil];
    [self initWithFootView:self];
    }
#warning mark 金额变化
- (void)num:(NSNotification *)notification{
    
    num = [notification.userInfo[@"num"]integerValue];
   
        self.nums = num*mon;
    
        self.money.text = [NSString stringWithFormat:@"¥ %ld",(long)self.nums];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [NSString stringWithFormat:@"%d",self.nums];
    
    
    [defaults setValue:str forKey:@"money"];
 [defaults synchronize];
    
}


- (void)initWithFootView:(UIView *)footView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 100, 40)];
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
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(label3.frame.origin.x +label3.frame.size.width, 0, 80, footView.frame.size.height)];
    label4.textColor = [UIColor whiteColor];
    label4.text = @"选择资源";
    label4.font = [UIFont systemFontOfSize:12];
    label4.backgroundColor = Color(249, 98, 30);
    [footView addSubview:label4];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(label3.frame.origin.x, 0, 170, footView.frame.size.height);
    [btn2 addTarget:self action:@selector(xiayibu) forControlEvents:UIControlEventTouchUpInside];
    btn2.userInteractionEnabled = YES;
    [footView addSubview:btn2];
    
    
    
}
- (void)mingxi{
    
        
    
    UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Frame.size.width-120, 150)];
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
    UILabel *zongLabel = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-60, imageView2.frame.origin.y+imageView2.frame.size.height+10, 60, 30)];
    zongLabel.text = self.money.text;
    zongLabel.textColor = [UIColor orangeColor];
    zongLabel.font = [UIFont systemFontOfSize:17];
    [alertView addSubview:zongLabel];
    UILabel *zongLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(alertView.frame.size.width-150, imageView2.frame.origin.y+imageView2.frame.size.height+10, 140, 30)];
    zongLabel2.text = @"订单总额：";
    
    zongLabel2.font = [UIFont systemFontOfSize:20];
    [alertView addSubview:zongLabel2];
    
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithName:@"" message:@"" color:[UIColor whiteColor] andBoolen:YES AlertsWidth:alertView.frame.size.width AlertsHeight:alertView.frame.size.height];
    alert.shopView = alertView;
        [alert show];
    }
- (void)xiayibu{
    
    
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ziYuan" object:nil];
        
    
   
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"title" object:nil];

    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"num" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"nums" object:nil];
}
@end
