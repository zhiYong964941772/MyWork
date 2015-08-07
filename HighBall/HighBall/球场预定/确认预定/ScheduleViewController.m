//
//  ScheduleViewController.m
//  HighBall
//
//  Created by imac on 15-4-27.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#define times @[@"06:00",@"06:30",@"07:00",@"07:30",@"08:00",@"08:30",@"09:00",@"09:30",@"10:00",@"10:30"]

#import "ScheduleViewController.h"
#import "BallSpellDetailsViewController.h"
#import "JKAlertDialog.h"
#import "WeatherViewController.h"
#import "CalendarHomeViewController.h"
#import "BallSpellAPI.h"
#import "CourselInfo.h"
#import "UIImageView+WebCache.h"
#import "ImageViewController.h"
#import "Weaterinfo.h"
#import "Weater.h"
#import "FillViewController.h"
#import "YMNumbers.h"

@interface ScheduleViewController ()<UIAlertViewDelegate>
{
    CalendarHomeViewController *chvc;
    bool isGeoSearch;
}
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
- (IBAction)dateBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *LoginLable;

@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *coursePrice;
@property (weak, nonatomic) IBOutlet UILabel *courses;

@property(nonatomic,strong)Weaterinfo *weaterInfo;
@property(nonatomic,strong)Weater *weater;
@property (weak, nonatomic) IBOutlet UILabel *indoor;
@property (weak, nonatomic) IBOutlet UILabel *weather;

@property(nonatomic,strong) NSString *startSlstName;
@property(nonatomic,strong) NSString *stopAddress;

@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)CLLocation *startLocation;
@property(nonatomic)CLLocationCoordinate2D stopLocation;

@property(nonatomic,strong)CourselInfo *courselInfo;

@property (weak, nonatomic) IBOutlet UIImageView *btnImage;
- (IBAction)images:(UIButton *)sender;
@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配IOS7
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    self.navigationController.navigationBarHidden=NO;
    
    [self initApi];
    [self initLod];
}

-(void)initApi
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
            Weater *w=[[Weater alloc]init];
            w=array[0];
            self.indoor.text=[NSString stringWithFormat:@"%@/%@",w.high,w.low];
            self.weather.text=w.type;
        }else
        {
            return;
        }
    }];
    
    [BallSpellAPI requestByGolfCourseID:self.courselID andCallBack:^(id obj) {
        self.courselInfo=obj;
        //附值
        self.courseName.text=self.courselInfo.courseName;
        self.coursePrice.text=[NSString stringWithFormat:@"¥%@",self.price];
        self.courses.text=[NSString stringWithFormat:@"%@码|%@洞|%@亩",self.courselInfo.courseLength,self.courselInfo.courseHoles,self.courselInfo.courseArea];
        
        //titile值
        self.title=self.courselInfo.courseName;
    }];
}

-(void)initLod
{
    //获取图片
    [self.btnImage sd_setImageWithURL:[NSURL URLWithString:self.courseIcon] placeholderImage:nil];
    //通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(location:) name:@"cllocation" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(slstName:) name:@"slstName" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fillOut:) name:@"fillOut" object:nil];
    
    //把NSUserDefaults中存储的值取出来
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *date=[ud objectForKey:@"date"];
    if (date!=nil) {
        [self.dateBtn setTitle:date forState:UIControlStateNormal];
    }
    //选择的球场
    NSString *cityName=[ud objectForKey:@"cityBallSpellName"];
    self.stopAddress=cityName;
   
    //返回按钮
  
}
//使用通知获得当前坐标和当前位置
-(void)location:(NSNotification *)noti
{
    CLLocation *location=[noti.userInfo objectForKey:@"location"];
    self.startLocation=location;
}

//使用通知获取当前位置的名字
-(void)slstName:(NSNotification *)noti
{
    NSString *slstName=[noti.userInfo objectForKey:@"slstName"];
    self.startSlstName=slstName;
}

-(void)fillOut:(NSNotification *)noti
{
    NSString *time=[noti.userInfo objectForKey:@"number"];
    [self.timeBtn setTitle:time forState:UIControlStateNormal];
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setObject:time forKey:@"time"];
    [ud synchronize];
}


//详情界面
- (IBAction)ScheduleAction:(UIButton *)sender {
    BallSpellDetailsViewController *vc=[[BallSpellDetailsViewController alloc]initWithNibName:@"BallSpellDetailsViewController" bundle:nil];
    vc.courselID=self.courselInfo.courseID;
    [self.navigationController pushViewController:vc animated:YES];
}

//点击进入手机地图导航（可获取当前定位的具体信息，目的地的信息后期调试看）
- (IBAction)politBtn:(UIButton *)sender {
    //起点部分完成
    CLLocationCoordinate2D coor1;
    coor1.latitude = 23.1483470000;
    coor1.longitude = 113.2680390000;
    
//    coor1.latitude=self.startLocation.coordinate.latitude;
//    coor1.longitude=self.startLocation.coordinate.longitude;
    MKMapItem *currentLocation = [[MKMapItem alloc]initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coor1 addressDictionary:nil] ];
    //开始地址，设置为自己当前位置
    currentLocation.name=@"广州市越秀区越秀公园";
//    currentLocation.name=self.startSlstName;
    
    
    //终点部分需要解码的坐标和地址
    CLLocationCoordinate2D coor2;
    coor2.latitude=23.1314650000;
    coor2.longitude=113.3856390000;
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coor2 addressDictionary:nil]];
    //结束位置，设置为选择的球场的地址位置
    toLocation.name=@"好又多(棠下店)";
    //toLocation.name = self.stopAddress;
    
    NSArray *items = [NSArray arrayWithObjects:currentLocation, toLocation, nil];
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES};
    //打开苹果自身地图应用，并呈现特定的item
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

//天气界面
- (IBAction)wetherAction:(id)sender {
    WeatherViewController *vc=[[WeatherViewController alloc]initWithNibName:@"WeatherViewController" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

//弹出时间选择窗口
- (IBAction)timeBtn:(id)sender {
    YMNumbers *view=[[YMNumbers alloc]init];
    view.numbersArr=times;
    CGFloat w = view.frame.size.width;
    CGFloat h = view.frame.size.height;
    UIColor *color=[UIColor blueColor];
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithTitle:@"时间选择" message:@"" color:color andBoolen:YES AlertsWidth:w AlertsHeight:h];
    alert.contentView = view;
    [alert show];
}

//日期的重新选择
- (IBAction)dateBtnAction:(id)sender {
    //日期选择页面
    if (!chvc) {
        chvc = [[CalendarHomeViewController alloc]init];
        [chvc setAirPlaneToDay:365 ToDateforString:nil];
    }
    chvc.calendarblock = ^(CalendarDayModel *model){
        [sender setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:[model toString] forKey:@"date"];
        [ud synchronize];
    };
    [self.navigationController pushViewController:chvc animated:YES];
}

//确认预定
- (IBAction)cheduleAction:(id)sender {
    FillViewController *vc=[[FillViewController alloc]initWithNibName:@"FillViewController" bundle:nil];
    vc.courseID=self.courselInfo.courseID;
    vc.nick=self.courselInfo.courseName;
    [self.navigationController pushViewController:vc animated:YES];
}

//图片列表
- (IBAction)images:(UIButton *)sender {
    ImageViewController *vc=[[ImageViewController alloc]init];
    vc.courseID=self.courselInfo.courseID;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
