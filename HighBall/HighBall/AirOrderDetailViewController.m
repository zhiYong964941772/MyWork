//
//  AirOrderDetailViewController.m
//  HighBall
//
//  Created by imac on 15-7-13.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirOrderDetailViewController.h"
#import "JKAlertDialog.h"

@interface AirOrderDetailViewController ()
@property (strong, nonatomic) IBOutlet UIView *backOrderView;

@end

@implementation AirOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backOrderAction:(id)sender {
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提醒" message:@"" color:color andBoolen:NO];
    alert.contentView=self.backOrderView;
    [alert show];
}
- (IBAction)btnAction:(id)sender {
    self.backOrderView.superview.superview.hidden=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
