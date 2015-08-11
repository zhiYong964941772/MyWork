//
//  WeChatViewController.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "WeChatViewController.h"

@interface WeChatViewController ()

@end

@implementation WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.text = @"确认交易";
  
    self.navigationItem.titleView = label;
    }

- (IBAction)payButton:(UIButton *)sender {
    NSLog(@"微信接口没有接入");
}

@end
