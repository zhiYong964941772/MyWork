//
//  ziYuanViewController.m
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ziYuanViewController.h"
#import "ziYuan.h"
@interface ziYuanViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fujiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenhjiLabel;
@property (weak, nonatomic) IBOutlet UILabel *danfangLabel;
@property (nonatomic,strong)ziYuan *fool;

@end
static NSInteger num = 0;
static NSInteger num2 = 0;
static NSInteger num3 = 0;

@implementation ziYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"选择资源";
    ziYuan *fool = [[ziYuan alloc]init];
    self.fool = fool;
    fool.danLabel.text = @"123";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [fool show:200];
    [defaults synchronize];
    [self.view addSubview:fool];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  套餐的增加费用
 *
 *  @param sender 利用监听事件实现数据同步
 */
- (IBAction)fujiaBtn:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            if (num>0) {
                num--;
                
            }
            self.fujiaLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
            
            break;
        case 1:
            num++;
            self.fujiaLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
           
            break;
        case 2:
            if (num2>0) {
                num2--;
               
            }
            self.shenhjiLabel.text = [NSString stringWithFormat:@"%ld",(long)num2];
            
            break;
        case 3:
            num2++;
            self.shenhjiLabel.text = [NSString stringWithFormat:@"%ld",(long)num2];
                        break;
        case 4:
            if (num3>0) {
                num3--;
                
            }
            self.danfangLabel.text = [NSString stringWithFormat:@"%ld",(long)num3];
            
            break;
        case 5:
            num3++;
            self.danfangLabel.text = [NSString stringWithFormat:@"%ld",(long)num3];
                       break;

    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"numOfziYuan" object:nil userInfo:@{@"num1":[NSString stringWithFormat:@"%ld",(long)num],@"num2":[NSString stringWithFormat:@"%ld",(long)num2],@"num3":[NSString stringWithFormat:@"%ld",(long)num3]}];
    
    
}

    


@end
