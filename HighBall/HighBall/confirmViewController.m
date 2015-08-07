//
//  confirmViewController.m
//  HighBall
//
//  Created by imac on 15-8-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "confirmViewController.h"
#import "JKAlertDialog.h"
@interface confirmViewController ()

@property (strong, nonatomic) IBOutlet UIView *payView;

@end

@implementation confirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//地址
- (IBAction)informationButton:(UIButton *)sender {
}
//物品数量
- (IBAction)shopButton:(UIButton *)sender {
}
//送货付款的方式
- (IBAction)transportButton:(UIButton *)sender {
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:@"付款方式" message:nil color:[UIColor blueColor] andBoolen:YES AlertsWidth:self.payView.frame.size.width AlertsHeight:self.payView.frame.size.height];
    alert.contentView = self.payView;
    [alert show];
}
//发票信息
- (IBAction)invoiceButton:(UIButton *)sender {
}
//订单
- (IBAction)orderButton:(UIButton *)sender {
}
- (IBAction)payButton:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            
            break;
            
        default:
            break;
    }
}


@end
