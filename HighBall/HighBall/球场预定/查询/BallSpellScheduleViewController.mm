//
//  BallSpellScheduleViewController.m
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "BallSpellScheduleViewController.h"
#import "ConcludSpellTableViewController.h"
#import "ScheduleViewController.h"
#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
#import "Color.h"
#import "BallSpellNameTableViewController.h"
#import "BallSpellCityViewController.h"

@interface BallSpellScheduleViewController ()<CLLocationManagerDelegate>
{
    CalendarHomeViewController *chvc;
    bool isGeoSearch;
}

- (IBAction)chooseBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *cityName;
@property (weak, nonatomic) IBOutlet UIButton *dateName;
@property (weak, nonatomic) IBOutlet UIButton *cityBallSpellName;

@end

@implementation BallSpellScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配IOS7
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    [self initLod];
    [self initvalue];
    
}

//布局
-(void)initLod
{
    //定位和解码
    _locaService=[[BMKLocationService alloc]init];
    _geoSearch=[[BMKGeoCodeSearch alloc]init];
    
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.title=@"条件查询";
    
    
}

#pragma mark init
-(void)initvalue
{
    //判断用户是否在首页点击了定位按钮和选择了城市
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *city=[ud objectForKey:@"city"];
    NSArray *cityNames=[ud objectForKey:@"cityBallSpellNames"];
    if(city!=nil)
    {
        [self.cityName setTitle:city forState:UIControlStateNormal];
    }else
    {
        [self.cityName setTitle:@"选择城市" forState:UIControlStateNormal];
    }
    
    if (cityNames!=nil) {
        [self.cityBallSpellName setTitle:cityNames.lastObject forState:UIControlStateNormal];
    }else
    {
        return;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    _locaService.delegate=self;
    _geoSearch.delegate=self;
    
    self.navigationController.navigationBarHidden=NO;
    
    //选择返回后分别的值
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *city=[ud objectForKey:@"city"];
    NSString *cityBallSpellName=[ud objectForKey:@"cityBallSpellName"];
    NSString *date=[ud objectForKey:@"date"];
    if (city!=nil) {
        [self.cityName setTitle:city forState:UIControlStateNormal];
    }
    if (cityBallSpellName!=nil)
    {
        [self.cityBallSpellName setTitle:cityBallSpellName forState:UIControlStateNormal];
    }
    if (date!=nil) {
        [self.dateName setTitle:date forState:UIControlStateNormal];
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    _locaService.delegate=self;
    _geoSearch.delegate=self;
}


#pragma mark - 定位服务
- (IBAction)position:(id)sender {
    NSLog(@"普通定位");
    [_locaService startUserLocationService];
}

-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    CLLocation *location=userLocation.location;
    CGFloat lat=location.coordinate.latitude;
    CGFloat lng=location.coordinate.longitude;
    //下通知，通知中保存当前自身的经纬度
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cllocation" object:nil userInfo:@{@"cllocation":location}];
    
    NSLog(@"lat:%f,lng:%f",lat,lng);
    //调用反解码方法
    [self ReverseGeoCodelat:23.1237880000 andLong:113.2902230000];
    //关闭定位
    [_locaService stopUserLocationService];
}

-(void)didFailToLocateUserWithError:(NSError *)error
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"定位失败，请重新点击定位，或者去城市列表页面选择" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma mark - 百度SDK反解码
//反解码
-(void)ReverseGeoCodelat:(CGFloat)lat andLong:(CGFloat)lng
{
    isGeoSearch=false;
    CLLocationCoordinate2D coor;
    coor.latitude=lat;
    coor.longitude=lng;
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption=[[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint=coor;
    BOOL flag=[_geoSearch reverseGeoCode:reverseGeocodeSearchOption];
    if (flag) {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}
//反解码调用的代理类
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error==BMK_SEARCH_NO_ERROR) {
        NSLog(@"asfsfds5+565++5+56+56");
        //把定位信息保存到本地，在天气页面调用
        NSString *address=result.address;
        NSArray *ss=[address componentsSeparatedByString:@"市"];
        NSString *sls=ss.firstObject;
        NSArray *s=[sls componentsSeparatedByString:@"省"];
        NSString *sq=s.lastObject;
        //打印一下得到的地址
        NSLog(@"%@",address);
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:sq forKey:@"city"];
        [ud synchronize];
        [self.cityName setTitle:sq forState:UIControlStateNormal];
            
    }else
    {
        NSLog(@"抱歉，未找到结果");
    }
}


#pragma mark - 搜索球场服务
- (IBAction)serchAction:(id)sender {
    BallSpellNameTableViewController *vc=[[BallSpellNameTableViewController alloc]initWithNibName:@"BallSpellNameTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 根据点击的不同按钮跳转到不同的操作页面
- (IBAction)chooseBtn:(UIButton *)sender {
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

                [sender setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
                NSLog(@"%@",[model toString]);
                NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
                [ud setObject:[model toString] forKey:@"date"];
                [ud synchronize];
            };
            [self.navigationController pushViewController:chvc animated:YES];
        }
            break;
        case 2:
        {
            //球场列表页面
            ConcludSpellTableViewController *vc=[[ConcludSpellTableViewController alloc]initWithNibName:@"ConcludSpellTableViewController" bundle:nil];
            NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
            NSString *city=[ud objectForKey:@"city"];
            NSString *date=[ud objectForKey:@"date"];
            NSString *cityBallSpellName=[ud objectForKey:@"cityBallSpellName"];
            vc.city=city;
            vc.date=date;
            vc.ballSpellName=cityBallSpellName;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

-(void)dealloc
{
    if (_geoSearch!=nil) {
        _geoSearch=nil;
    }
    if (_locaService!=nil) {
        _locaService=nil;
    }
}

@end
