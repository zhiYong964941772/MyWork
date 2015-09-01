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
@property (weak, nonatomic) IBOutlet UILabel *peploNum;
@property (weak, nonatomic) IBOutlet UILabel *fujiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenhjiLabel;
@property (weak, nonatomic) IBOutlet UILabel *danfangLabel;
@property (nonatomic,strong)ziYuan *fool;
@property (weak, nonatomic) IBOutlet UILabel *calender;
@property (strong,nonatomic)NSString *calenderStr;
@property (strong,nonatomic)NSString *calenderStr2;
@property (strong,nonatomic)NSString *money;
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
   
    [self UserDefaults];
   
    
   
   
    }
/**
 *  获取其他页面的数据
 */
- (void)UserDefaults{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ziYuan) name:@"ziYuan123" object:nil];
    
    ziYuan *fool = [[ziYuan alloc]init];
    self.fool = fool;
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.calenderStr =  [defaults objectForKey:@"dateOfziYuan"];
    self.calenderStr2 = [defaults objectForKey:@"dateOf"];
    self.money = [defaults objectForKey:@"money"];
    self.peploNum.text = [NSString stringWithFormat:@"%@成人",[defaults objectForKey:@"peopleNum"]];
    self.calender.text = [NSString stringWithFormat:@"%@%@日",self.calenderStr,self.calenderStr2];
    NSLog(@"%@",self.money);
    [fool show:self.money andHeaderName: @"选择资源"];
    [defaults synchronize];
     [self.view addSubview:fool];
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
    self.calender.text = @"0";
    
    self.calenderStr = @"";
    
    self.calenderStr2 = @"";
    self.danfangLabel.text = @"0";
    self.shenhjiLabel.text = @"0";
    self.fujiaLabel.text = @"0";
    self.money = @"0";
}
    


@end
