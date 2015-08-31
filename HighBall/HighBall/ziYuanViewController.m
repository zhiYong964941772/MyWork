//
//  ziYuanViewController.m
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ziYuanViewController.h"
#import "ziYuan.h"
#import "dingDanViewController.h"
@interface ziYuanViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fujiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenhjiLabel;
@property (weak, nonatomic) IBOutlet UILabel *danfangLabel;
@property (nonatomic,strong)ziYuan *fool;
@property (weak, nonatomic) IBOutlet UILabel *calender;
@property (strong,nonatomic)NSString *calenderStr;
@end
static NSInteger num = 0;
static NSInteger num2 = 0;
static NSInteger num3 = 0;

@implementation ziYuanViewController
+(void)initWithLabel:(labelName)blockLabel{
    blockLabel(@"123",@"456",@"789");

}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"选择资源";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ziYuan) name:@"ziYuan123" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(labelName:) name:@"labelName" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(btnName:) name:@"btnName" object:nil];
    ziYuan *fool = [[ziYuan alloc]init];
    self.fool = fool;
    
           [fool show:200 andHeaderName: @"选择资源"];
    
    
    [self.view addSubview:fool];
   
    }
- (void)labelName:(NSNotification *)notification{
    self.calenderStr = notification.userInfo[@"labelName"];
}
- (void)btnName:(NSNotification *)notification{
    NSString *str = notification.userInfo[@"btnName"];
    self.calender.text = [NSString stringWithFormat:@"%@%@日",self.calenderStr,str];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@日",self.calenderStr,str]);
    
}
- (void)ziYuan{
    dingDanViewController *dingDan = [[dingDanViewController alloc]initWithNibName:@"dingDanViewController" bundle:nil];
    [self.navigationController pushViewController:dingDan animated:YES];
    
    
    
    
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
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ziYuan123" object:nil];
}
    


@end
