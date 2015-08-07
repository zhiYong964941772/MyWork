//
//  PubSelectViewController.m
//  HighBall
//
//  Created by imac on 15-7-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PubSelectViewController.h"
#import "PubsTableViewController.h"
#import "BallSpellCityViewController.h"
#import "CalendarHomeViewController.h"

@interface PubSelectViewController ()
{
    CalendarHomeViewController *chvc;
}
- (IBAction)btnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *cityName;
@property (weak, nonatomic) IBOutlet UIButton *moveDate;
@property (weak, nonatomic) IBOutlet UIButton *leaveName;
@property (weak, nonatomic) IBOutlet UILabel *infoSmall;

@end

@implementation PubSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配IOS7.0
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    [self initUI];
}

-(void)initUI
{
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.title=@"酒店预定";
    
   
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"blueNavi.png"] forBarMetrics:UIBarMetricsDefault];
}



-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *city=[ud objectForKey:@"city"];
    NSString *month1=[ud objectForKey:@"month1"];
    NSString *month2=[ud objectForKey:@"month2"];
    NSString *day1=[ud objectForKey:@"day1"];
    NSString *day2=[ud objectForKey:@"day2"];
    if (city!=nil) {
        [self.cityName setTitle:city forState:UIControlStateNormal];
    }
    
    if (month1!=nil&&month2!=nil) {
        int mon1=[month1 intValue];
        int mon2=[month2 intValue];
        int da1=[day1 intValue];
        int da2=[day2 intValue];
        [self.moveDate setTitle:[NSString stringWithFormat:@"%d/%d",mon1,da1] forState:UIControlStateNormal];
        [self.leaveName setTitle:[NSString stringWithFormat:@"%d/%d",mon2,da2] forState:UIControlStateNormal];
        if (mon1==mon2) {
            int infos=da2-da1;
            self.infoSmall.text=[NSString stringWithFormat:@"住   %d   晚",infos];
        }else
        {
            if (mon1==1||mon1==3||mon1==5||mon1==7||mon1==8||mon1==10||mon1==12) {
                int infos=(mon2-mon1)*31+(da2-da1);
                self.infoSmall.text=[NSString stringWithFormat:@"住   %d   晚",infos];
            }else
            {
                int infos=(mon2-mon1)*30+(da2-da1);
                self.infoSmall.text=[NSString stringWithFormat:@"住   %d   晚",infos];
            }
        }
        
    }
}
- (IBAction)pubsAction:(id)sender {
    PubsTableViewController *vc=[[PubsTableViewController alloc]initWithNibName:@"PubsTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
            //城市选择页面
            BallSpellCityViewController *vc=[[BallSpellCityViewController alloc]initWithNibName:@"BallSpellCityViewController" bundle:nil];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            //日期选择页面
            if (!chvc) {
                chvc = [[CalendarHomeViewController alloc]init];
                [chvc setAirPlaneToDay:365 ToDateforString:nil];
            }
            chvc.calendarblock = ^(CalendarDayModel *model){
                
                [sender setTitle:[NSString stringWithFormat:@"%@/%@",[model montha],[model daya]] forState:UIControlStateNormal];
                NSLog(@"大风过后的方式＝%@/%@",[model montha],[model daya]);
                NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
                [ud setObject:[model montha] forKey:@"month1"];
                [ud setObject:[model daya] forKey:@"day1"];
                [ud synchronize];
            };
            [self.navigationController pushViewController:chvc animated:YES];
        }
            break;
        case 2:
        {
            //日期选择页面
            if (!chvc) {
                chvc = [[CalendarHomeViewController alloc]init];
                [chvc setAirPlaneToDay:365 ToDateforString:nil];
            }
            chvc.calendarblock = ^(CalendarDayModel *model){
                
                [sender setTitle:[NSString stringWithFormat:@"%@/%@",[model montha],[model daya]] forState:UIControlStateNormal];
                NSLog(@"aijsdjgjad＝%@/%@",[model montha],[model daya]);
                NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
                [ud setObject:[model montha] forKey:@"month2"];
                [ud setObject:[model daya] forKey:@"day2"];
                [ud synchronize];
            };
            [self.navigationController pushViewController:chvc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}
@end
