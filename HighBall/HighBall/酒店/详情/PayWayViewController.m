//
//  PayWayViewController.m
//  HighBall
//
//  Created by imac on 15-7-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PayWayViewController.h"
#import "PayOrderTableViewController.h"

@interface PayWayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *PubName;
@property (weak, nonatomic) IBOutlet UILabel *price;
- (IBAction)payWays:(UIButton *)sender;
- (IBAction)creditCardExplain:(id)sender;

@end

@implementation PayWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PubName.text=self.payName;
    self.price.text=[NSString stringWithFormat:@"¥ %@.00",self.payPrice];
    
    self.title=@"支付方式";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)payWays:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
            NSLog(@"微信支付");
        }
            break;
        case 1:
        {
            NSLog(@"信用卡支付");
        }
            break;
        case 2:
        {
            NSLog(@"储蓄卡支付");
        }
            break;
        case 3:
        {
            NSLog(@"支付宝支付");
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)creditCardExplain:(id)sender {
    PayOrderTableViewController *vc=[[PayOrderTableViewController alloc]initWithNibName:@"PayOrderTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
