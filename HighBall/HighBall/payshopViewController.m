//
//  payshopViewController.m
//  HighBall
//
//  Created by imac on 15-8-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "payshopViewController.h"
#import "JKAlertDialog.h"
@interface payshopViewController ()
@property (strong, nonatomic) IBOutlet UIView *paySucceedView;

@end

@implementation payshopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"余额支付";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//立即支付
- (IBAction)payButton:(id)sender {
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:@"温馨提醒" message:@"" color:[UIColor blueColor] andBoolen:YES AlertsWidth:self.paySucceedView.frame.size.width AlertsHeight:self.paySucceedView.frame.size.height];
    alert.contentView = self.paySucceedView;
    [alert show];}


@end
