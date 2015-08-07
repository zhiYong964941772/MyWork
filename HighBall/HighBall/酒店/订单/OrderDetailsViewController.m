//
//  OrderDetailsViewController.m
//  HighBall
//
//  Created by imac on 15-7-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "OrderDetailsViewController.h"
#import "JKAlertDialog.h"

@interface OrderDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *checkCenter;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

@property (weak, nonatomic) IBOutlet UILabel *checkAccomplish;
@property (weak, nonatomic) IBOutlet UIButton *backOrder;

@property (strong, nonatomic) IBOutlet UIView *requestCancelView;
@property (strong, nonatomic) IBOutlet UIView *requestBackOrderView;

@property (weak, nonatomic) IBOutlet UILabel *orderHaoLable;
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *roomLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;


@end

@implementation OrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initValue];
}

-(void)initUI
{
    self.number=1;
    if (self.number==0) {
        self.checkAccomplish.hidden=YES;
        self.backOrder.hidden=YES;
        self.checkCenter.hidden=NO;
        self.cancel.hidden=NO;
    }else
    {
        self.checkAccomplish.hidden=NO;
        self.backOrder.hidden=NO;
        self.checkCenter.hidden=YES;
        self.cancel.hidden=YES;
    }
}

-(void)initValue
{
    self.orderHaoLable.text=@"NHHCF1555";
    self.nickLable.text=@"广州市陆虎国际大酒店";
    self.dateLable.text=@"7/19";
    self.nameLable.text=@"朱晓旭";
    self.phoneLable.text=@"159488625495";
    self.priceLable.text=@"¥259";
    
    self.title=@"订单详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancel:(id)sender {
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.requestCancelView.frame.size.width;
    CGFloat h = self.requestCancelView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.requestCancelView;
    [alert show];
}
- (IBAction)backorder:(id)sender {
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.requestBackOrderView.frame.size.width;
    CGFloat h = self.requestBackOrderView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.requestBackOrderView;
    [alert show];
}

@end
