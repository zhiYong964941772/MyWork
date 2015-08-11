//
//  confirmViewController.m
//  HighBall
//
//  Created by imac on 15-8-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "confirmViewController.h"
#import "JKAlertDialog.h"
#import "payshopViewController.h"
#import "PayWayViewController.h"
#import "listViewController.h"
#import "addressViewController.h"
#import "invoiceViewController.h"
@interface confirmViewController ()
@property (weak, nonatomic) IBOutlet UILabel *payLabel;
@property (strong,nonatomic) JKAlertDialog *alert;
@property (strong, nonatomic) IBOutlet UIView *payView;
@property (strong, nonatomic) IBOutlet UIView *paySucceedView;
@end

@implementation confirmViewController
#define button self.moneyButton.selected = !self.moneyButton.selected
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *payName = [defaults objectForKey:@"pay"];
    self.payLabel.text = payName;
        self.alert.hidden = YES;
}
- (IBAction)moneyButton:(UIButton *)sender {
    if ([self.payLabel.text isEqualToString:@"在线支付"]) {
        PayWayViewController *vc=[[PayWayViewController alloc]initWithNibName:@"PayWayViewController" bundle:nil];
        
        [self.navigationController pushViewController:vc animated:YES];

        
    }else if([self.payLabel.text isEqualToString:@"资金支付"]){
        payshopViewController *pay = [[payshopViewController alloc]initWithNibName:@"payshopViewController" bundle:nil];
        [self.navigationController pushViewController:pay animated:YES];
    }else{
        NSLog(@"请选择支付方式");
    }

}
//地址
- (IBAction)informationButton:(UIButton *)sender {
    addressViewController *address = [[addressViewController alloc]initWithNibName:@"addressViewController" bundle:nil];
    [self.navigationController pushViewController:address animated:YES];
}
//物品数量
- (IBAction)shopButton:(UIButton *)sender {
    listViewController *list = [[listViewController alloc]initWithNibName:@"listViewController" bundle:nil];
    [self.navigationController pushViewController:list animated:YES];
}
//送货付款的方式
- (IBAction)transportButton:(UIButton *)sender {
    UIColor *color = [UIColor blueColor];
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:@"付款方式" message:nil color:color andBoolen:YES AlertsWidth:self.payView.frame.size.width AlertsHeight:self.payView.frame.size.height];
    alert.contentView = self.payView;
    self.alert = alert;
    [alert show];
}
//发票信息
- (IBAction)invoiceButton:(UIButton *)sender {
    invoiceViewController *invoice = [[invoiceViewController alloc]initWithNibName:@"invoiceViewController" bundle:nil];
    [self.navigationController pushViewController:invoice animated:YES];
    
}



- (IBAction)payButton:(UIButton *)sender {
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switch (sender.tag) {
           
        case 0:
                        [defaults setObject:sender.titleLabel.text forKey:@"pay"];
            [self viewWillAppear:YES];
            
            
            break;
        case 1:
            [defaults setObject:sender.titleLabel.text forKey:@"pay"];
           
            [self viewWillAppear:YES];
            
            break;
        case 2:
            [defaults setObject:sender.titleLabel.text forKey:@"pay"];
            JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:@"温馨提醒" message:@"" color:[UIColor blueColor] andBoolen:YES AlertsWidth:self.paySucceedView.frame.size.width AlertsHeight:self.paySucceedView.frame.size.height];
            alert.contentView = self.paySucceedView;
            [alert show];
            [self viewWillAppear:YES];
            break;

    }
    [defaults synchronize];
}


@end
