//
//  CadinDaileViewController.m
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "CadinDaileViewController.h"
#import "ChoosePersonViewController.h"
#import "JKAlertDialog.h"
#import "AirOrderTableViewController.h"
#import "PayWayViewController.h"

@interface CadinDaileViewController ()
- (IBAction)choosePersonAction:(id)sender;
- (IBAction)paySucceedAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *pointsAttentionView;
@property (weak, nonatomic) IBOutlet UILabel *orderHaoLable;

@property (strong, nonatomic) IBOutlet UIView *paySucceedView;
@end

@implementation CadinDaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"航班详情";
    self.orderHaoLable.text=@"我日";
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.paySucceedView.frame.size.width;
    CGFloat h = self.paySucceedView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.paySucceedView;
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//可退改签按钮
- (IBAction)cancelBack:(id)sender {
    self.pointsAttentionView.hidden=NO;
}
//tap手势
- (IBAction)tapPointView:(id)sender {
    self.pointsAttentionView.hidden=YES;
}

//选择支付界面
- (IBAction)payAirFlightBtn:(id)sender {
    PayWayViewController *vc=[[PayWayViewController alloc]initWithNibName:@"PayWayViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

//新增乘机人
- (IBAction)choosePersonAction:(id)sender {
    ChoosePersonViewController *vc=[[ChoosePersonViewController alloc]initWithNibName:@"ChoosePersonViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)paySucceedAction:(id)sender
{
    self.paySucceedView.superview.superview.hidden=YES;
    AirOrderTableViewController *vc=[[AirOrderTableViewController alloc]initWithNibName:@"AirOrderTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
