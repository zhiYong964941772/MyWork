//
//  AirTicketViewController.m
//  HighBall
//
//  Created by imac on 15-7-9.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirTicketViewController.h"
#import "AirFlightViewController.h"
#import "CalendarHomeViewController.h"
#import "BallSpellCityViewController.h"
#import "AirTilketCityViewController.h"
#import "JKAlertDialog.h"
@interface AirTicketViewController ()
@property (weak, nonatomic) IBOutlet UIButton *oneCityName;
@property (weak, nonatomic) IBOutlet UIButton *twoCityName;
@property (weak, nonatomic) IBOutlet UIButton *threeCityName;
@property (weak, nonatomic) IBOutlet UIButton *fronCityName;
@property (weak, nonatomic) IBOutlet UIView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *oneWaybtn;
@property (weak, nonatomic) IBOutlet UIButton *traVelbtn;
@property (weak, nonatomic) IBOutlet UIButton *OneBunk;
@property (weak, nonatomic) IBOutlet UIButton *twoBunk;
@property (strong, nonatomic) IBOutlet UIView *passengerView;
@property (weak, nonatomic) IBOutlet UIButton *passengerOne;
@property (weak, nonatomic) IBOutlet UIButton *passengerTwo;
@property (weak,nonatomic)JKAlertDialog *alert;
@property (nonatomic,strong)BallSpellCityViewController *bvc;
@property (nonatomic,strong)CalendarHomeViewController *chvc;
@property (nonatomic,strong)AirTilketCityViewController *avc;
@property (nonatomic,strong)NSString *airName;
@property (weak, nonatomic) IBOutlet UIView *traVelView;
@property (strong, nonatomic) IBOutlet UIView *AirBunkView;

@end

@implementation AirTicketViewController
static NSInteger app;
static NSInteger apps;

- (BallSpellCityViewController *)bvc{
    if (!_bvc) {
        _bvc = [[BallSpellCityViewController alloc]init];
    }
    return _bvc;
}
- (AirTilketCityViewController *)avc{
    if (!_avc) {
        _avc = [[AirTilketCityViewController alloc]init];
       
    }
    return _avc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //适配IOS7.0
   
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    
    [self initUI];
    [self initCityName:self.oneCityName];
    }
- (void)initCityName:(UIButton *)cityName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *city=[defaults objectForKey:@"city"];
    if (cityName == self.oneCityName) {
        
    
    if(city!=nil)
    {
        [cityName setTitle:city forState:UIControlStateNormal];}
    }else
    {
        [cityName setTitle:@"选择城市" forState:UIControlStateNormal];
    }
    
    
}

-(void)initUI
{
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.title=@"机票预定";
    
    
    
       
    
}


- (IBAction)btnImageAction:(UIButton *)sender {
    //下面红色线条的移动
    CGRect frame=self.imageView.frame;
    frame.origin.x=sender.tag*sender.frame.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.frame=frame;
    }];
    
    if (sender.tag==0) {
        [self.oneWaybtn setTitleColor:[UIColor blueColor] forState:70.0/255];
        [self.traVelbtn setTitleColor:[UIColor colorWithRed:70.0/255 green:70.0/255 blue:70.0/255 alpha:1.0] forState:70.0/255];
        self.traVelView.hidden=YES;
    }else
    {
        [self.traVelbtn setTitleColor:[UIColor blueColor] forState:70.0/255];
        [self.oneWaybtn setTitleColor:[UIColor colorWithRed:70.0/255 green:70.0/255 blue:70.0/255 alpha:1.0] forState:70.0/255];
        self.traVelView.hidden=NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
    [self.alert removeFromSuperview];
        if (app ==0) {
        [self buttonCityName:self.oneCityName];
    }else if (app == 1){
        [self buttonCityName:self.twoCityName];}
    else if (app == 2){
        [self buttonCityName:self.threeCityName];}
    else if (app ==3){
        [self buttonCityName:self.fronCityName];}
    
    [self buttonWithBunk:self.OneBunk];
    [self buttonWithBunk:self.twoBunk];
    [self passengerWithButton:self.passengerOne];
     [self passengerWithButton:self.passengerTwo];
    
}
- (void)buttonCityName:(UIButton *)btn{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *city = [defaults objectForKey:@"city"];
   
 [btn setTitle:city forState:UIControlStateNormal];

}
- (void)buttonWithBunk:(UIButton *)btn {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *bunk = [defaults objectForKey:@"bunk"];
    [btn setTitle:bunk forState:UIControlStateNormal];
    
    
}
- (void)passengerWithButton:(UIButton *)btn{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *passenger = [defaults objectForKey:@"passenger"];
    [btn setTitle:passenger forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectAction:(id)sender {
    AirFlightViewController *vc=[[AirFlightViewController alloc]initWithNibName:@"AirFlightViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)dayButton:(UIButton *)sender {
    if (!self.chvc) {
        self.chvc = [[CalendarHomeViewController alloc]init];
        [self.chvc setAirPlaneToDay:365 ToDateforString:nil];
    }
    self.chvc.calendarblock = ^(CalendarDayModel *model){
        
        [sender setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
        NSLog(@"%@",[model toString]);
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:[model toString] forKey:@"date"];
        [ud synchronize];
    };
    [self.navigationController pushViewController:self.chvc animated:YES];

    
}

- (IBAction)ButtonCityName:(UIButton *)sender {
    
    app = sender.tag;
    switch (sender.tag) {
        case 0:
            [self.delegate cityWithName:@"出发城市" Entrust:self];

            [self.navigationController pushViewController:self.avc animated:YES];
            
                        break;
        case 1:
             [self.delegate cityWithName:@"目的城市" Entrust:self];
            [self.navigationController pushViewController:self.avc animated:YES];
            
            break;
        case 2:
            [self.delegate cityWithName:@"目的城市" Entrust:self];
            [self.navigationController pushViewController:self.avc animated:YES];
                  break;
        case 3:
            [self.delegate cityWithName:@"出发城市" Entrust:self];
            [self.navigationController pushViewController:self.avc animated:YES];
            
            break;

}
    
    
}
- (IBAction)BunkButton:(UIButton *)sender {
    
    self.airName = @"舱位选择";
    UIColor *color = [UIColor blueColor];
    CGFloat w = self.AirBunkView.frame.size.width;
    CGFloat h = self.AirBunkView.frame.size.height;
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:self.airName message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    alert.contentView = self.AirBunkView;
    self.alert = alert;
    [alert show];
}
- (IBAction)bunkButton:(UIButton *)sender {
    NSUserDefaults *bunkName = [NSUserDefaults standardUserDefaults];
    
        apps = sender.tag;
    
    switch (sender.tag) {
        case 0:
            
            [bunkName setObject:@"舱位不限"forKey:@"bunk"];
              [self viewWillAppear:YES];
            break;
        case 1:
            [bunkName setObject:@"经济舱"forKey:@"bunk"];
              [self viewWillAppear:YES];
            break;
        case 2:
            [bunkName setObject:@"公务舱"forKey:@"bunk"];
              [self viewWillAppear:YES];
            break;
        case 3:
            [bunkName setObject:@"头等舱"forKey:@"bunk"];
              [self viewWillAppear:YES];
            

            
            break;


           }
    [bunkName synchronize];
    
}

- (IBAction)passengerButton:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switch (sender.tag) {
        case 0:
            [defaults setObject:@"儿童(2~12岁)" forKey:@"passenger"];
            [self viewWillAppear:YES];
            
            break;
            
       case 1:
            [defaults setObject:@"成人" forKey:@"passenger"];
            [self viewWillAppear:YES];
            break;
    }
    [defaults synchronize];
    
    
}
- (IBAction)passenger:(UIButton *)sender {
    self.airName = @"乘客选择";
    UIColor *color = [UIColor blueColor];
    CGFloat w = self.AirBunkView.frame.size.width;
    CGFloat h = self.AirBunkView.frame.size.height;
    JKAlertDialog *alerts = [[JKAlertDialog alloc]initWithTitle:self.airName message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    alerts.contentView = self.passengerView;
    self.alert = alerts;
    [alerts show];
    
    
}


@end
