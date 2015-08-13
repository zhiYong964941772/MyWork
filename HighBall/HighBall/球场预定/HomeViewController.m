//
//  HomeViewController.m
//  HighBall
//
//  Created by imac on 15-6-30.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "BallSpellScheduleViewController.h"
#import "BallSpellInfo.h"
#import "BallSpellAPI.h"
#import "BallSpellDetailsViewController.h"
#import "ScheduleViewController.h"
#import "BallSpellCityViewController.h"
#import "SqliteData.h"
#import "PubSelectViewController.h"
#import "AirTicketViewController.h"
#import "shoopHomeViewController.h"
#import "AirFight.h"
#import "shopViewController.h"
#import "mealViewController.h"
@interface HomeViewController (){
    SqliteData *_dataDB;//引用数据库
    bool isGeoSearch;
}
@property (strong, nonatomic) IBOutlet UIView *header;//表头视图
@property (strong, nonatomic) IBOutlet UIView *headerView;//表头栏目视图
@property (weak, nonatomic) IBOutlet UITableView *tableView;//主视图
@property (weak, nonatomic) IBOutlet UILabel *cityName;//定位的城市的名字
@property(nonatomic,strong)NSArray *ballInfos;//声明一个存储所有球场的数组
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ballInfos=[NSArray array];
    _dataDB=[[SqliteData alloc]init];
    [_dataDB createDataBase];
    
    [self initLoad];
    [self initValue];
}

#pragma mark init
-(void)initLoad
{
    //定位解码
    _locaService=[[BMKLocationService alloc]init];
    _geoSearch=[[BMKGeoCodeSearch alloc]init];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.navigationController.navigationBarHidden=YES;
    
    self.tableView.tableHeaderView=self.header;
    if ([[UIDevice currentDevice].systemVersion floatValue]>= 7.0){
        CLLocationManager *locationManager = [[CLLocationManager alloc]init];
        [locationManager requestAlwaysAuthorization];
        [locationManager requestWhenInUseAuthorization];
        
        
        
    }
    
    
    
    

    
    
}
-(void)initValue
{
    
    //调用ballspellAPI的方法解析完球场列表数据后回调
    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        if (obj==0) {
            self.ballInfos=[_dataDB findWith];
            [self.tableView reloadData];
        }
        else
        {
            self.ballInfos=obj;
            [_dataDB deletDataBase];
            for (BallSpellInfo *ba in self.ballInfos) {
                [_dataDB saveUser:ba];
            }
            [self.tableView reloadData];
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated
{//设置代理，项目运行后将数据持久化，界面每出现一次
    _locaService.delegate=self;
    _geoSearch.delegate=self;
    
    self.navigationController.navigationBarHidden=YES;
    
    NSString *city=[[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
    
    if (city!=nil)
    {
        [self.cityName setText:city];
    }else
    {
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:@"广州" forKey:@"city"];
        [ud synchronize];
        [self.cityName setText:@"广州"];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    _locaService.delegate=nil;
    _geoSearch.delegate=nil;
}

//城市选择
- (IBAction)cityAction:(id)sender {
    BallSpellCityViewController *vc=[[BallSpellCityViewController alloc]initWithNibName:@"BallSpellCityViewController" bundle:nil];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}
//电话热线
- (IBAction)phoneAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1008611"]];
}
//推荐
- (IBAction)recommendAction:(id)sender {
    NSLog(@"123456789");
}

#pragma mark mapAction
//定位
- (IBAction)mapAction:(id)sender {
    //开启普通定位
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
    
    NSLog(@"lat:%f,lng%f",lat,lng);
    //调用反解码方法
    [self ReverseGeoCodelat:23.1237880000 andLong:113.2902230000];
    //关闭定位
    [_locaService stopUserLocationService];
}
//定位失败调用
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
        [self.cityName setText:sq];
        
    }else
    {
        NSLog(@"抱歉，未找到结果");
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.ballInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MyCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:self options:nil]lastObject];
    }
    cell.ballInfo=self.ballInfos[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScheduleViewController *vc=[[ScheduleViewController alloc]initWithNibName:@"ScheduleViewController" bundle:nil];
    BallSpellInfo *ballInfo=self.ballInfos[indexPath.row];
    vc.courselID=ballInfo.courseID;
    vc.price=ballInfo.price;
    vc.courseIcon=ballInfo.courseIcon;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (IBAction)btnAction:(UIButton *)sender {
    NSLog(@"%ld",(long)sender.tag);
    
    switch (sender.tag) {
        case 0:
        {
            BallSpellScheduleViewController *vc=[[BallSpellScheduleViewController alloc]initWithNibName:@"BallSpellScheduleViewController" bundle:nil];
            //隐藏下面的toolbar
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {
            PubSelectViewController *vc=[[PubSelectViewController alloc]initWithNibName:@"PubSelectViewController" bundle:nil];
            //隐藏下面的toolbar
           vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            AirTicketViewController *vc=[[AirTicketViewController alloc]initWithNibName:@"AirTicketViewController" bundle:nil];
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            
            
            
            shopViewController *tar = [[shopViewController alloc]init];
       
            [self presentViewController:tar animated:NO completion:nil];
        }
            break;
        case 4:
        {
            mealViewController *meal = [[mealViewController alloc]initWithNibName:@"mealViewController" bundle:nil];
            meal.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:meal animated:YES];
            
            
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
        }
            break;
        case 10:
        {
            
        }
            break;
        case 11:
        {
            
        }
            break;
        case 12:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

@end
