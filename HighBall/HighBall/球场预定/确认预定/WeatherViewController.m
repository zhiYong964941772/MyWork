//
//  WeatherViewController.m
//  HighBall
//
//  Created by imac on 15-4-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "WeatherViewController.h"
#import "BallSpellAPI.h"
#import "Weaterinfo.h"
#import "Weater.h"

@interface WeatherViewController ()
@property(nonatomic,strong)Weaterinfo *weaterInfo;
@property(nonatomic,strong)Weater *weater;

@property (weak, nonatomic) IBOutlet UILabel *week0;
@property (weak, nonatomic) IBOutlet UIImageView *img0;
@property (weak, nonatomic) IBOutlet UILabel *indoor0;
@property (weak, nonatomic) IBOutlet UILabel *type0;

@property (weak, nonatomic) IBOutlet UILabel *week1;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UILabel *indoor1;
@property (weak, nonatomic) IBOutlet UILabel *type1;

@property (weak, nonatomic) IBOutlet UILabel *week2;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UILabel *indoor2;
@property (weak, nonatomic) IBOutlet UILabel *type2;


@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLod];
}

-(void)initLod
{
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *city=[ud objectForKey:@"city"];
    if (city==nil) {
        city=@"广州";
    }
    [BallSpellAPI requestWeatherByCity:city andCallback:^(id obj) {
        self.weaterInfo=obj;
        if ([self.weaterInfo.desc isEqualToString:@"OK"])
        {
            NSArray *array=[NSArray array];
            array=self.weaterInfo.weterArr;
            NSLog(@"%@",array);
            Weater *w0=[[Weater alloc]init];
            w0=array[0];
            self.week0.text=[NSString stringWithFormat:@"今天  %@",w0.date];
            self.indoor0.text=[NSString stringWithFormat:@"%@/%@",w0.high,w0.low];
            self.type0.text=w0.type;
            NSLog(@"date=%@,indoor=%@/%@,type=%@",w0.date,w0.high,w0.low,w0.type);
            
            Weater *w1=[[Weater alloc]init];
            w1=array[1];
            self.week1.text=w1.date;
            self.indoor1.text=[NSString stringWithFormat:@"%@/%@",w1.high,w1.low];
            self.type1.text=w1.type;
            NSLog(@"date=%@,indoor=%@/%@,type=%@",w1.date,w1.high,w1.low,w1.type);
            
            Weater *w2=[[Weater alloc]init];
            w2=array[2];
            self.week2.text=w2.date;
            self.indoor2.text=[NSString stringWithFormat:@"%@/%@",w2.high,w2.low];
            self.type2.text=w2.type;
            NSLog(@"date=%@,indoor=%@/%@,type=%@",w2.date,w2.high,w2.low,w2.type);
        }else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"您所查询的城市不再录入范围内" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0||buttonIndex==1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
