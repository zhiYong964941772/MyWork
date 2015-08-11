//
//  invoiceViewController.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "invoiceViewController.h"

@interface invoiceViewController ()

@end

@implementation invoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCenterImage];
}
- (void)initCenterImage{
    CGRect frame = [[UIScreen mainScreen]bounds];
    UIImage *image = [UIImage imageNamed:@"虚线.jpg"];
    UIImageView *iv = [[UIImageView alloc]initWithImage:image];
    iv.frame = CGRectMake(0, 0, frame.size.width-30, 60);
    iv.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [self.view addSubview:iv];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, iv.frame.size.height/2+10, iv.frame.size.width-20, 20)];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    label.text = @"注：商品发票由卖家开具、寄出，发票由卖家决定";
    [iv addSubview:label];
    
    
    
}


@end
