//
//  MapViewController.m
//  HighBall
//
//  Created by imac on 15-5-8.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<UIAlertViewDelegate>
@property(nonatomic,strong)NSMutableArray *mapsArr;
@property(nonatomic)float lat;
@property(nonatomic)float lng;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPointAnnotation];
    //适配IOS7
    self.mapsArr=[NSMutableArray array];
    if (([[[UIDevice currentDevice] systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    _geoSearch=[[BMKGeoCodeSearch alloc]init];
    //设置地图缩放级别
    _mapView.mapType=BMKMapTypeStandard;
    [_mapView setZoomLevel:12];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate=self;
    _geoSearch.delegate=self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate=nil;
    _geoSearch.delegate=nil;
}

-(void)dealloc
{
    if (_mapView) {
        _mapView=nil;
    }
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addPointAnnotation
{
    
    self.mapsArr=[NSMutableArray array];

    BMKPointAnnotation *pointAnnotation1=[[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude=23.0703590000;
    coor.longitude=113.3311470000;
    pointAnnotation1.coordinate=coor;
    _mapView.centerCoordinate=coor;
    pointAnnotation1.title=@"景业高尔夫球会所";
    pointAnnotation1.subtitle=@"金额:¥ 738";
    [self.mapsArr addObject:pointAnnotation1];
    
    BMKPointAnnotation *pointAnnotation3=[[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor2;
    coor2.latitude=23.1535450000;
    coor2.longitude=113.2885390000;
    pointAnnotation3.coordinate=coor2;
    pointAnnotation3.title=@"广州麓湖高尔夫球乡村俱乐部";
    pointAnnotation3.subtitle=@"金额:¥ 547";
    [self.mapsArr addObject:pointAnnotation3];
    
    BMKPointAnnotation *pointAnnotation4=[[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor3;
    coor3.latitude=23.1512110000;
    coor3.longitude=113.3835510000;
    pointAnnotation4.coordinate=coor3;
    pointAnnotation4.title=@"宜高高尔夫俱乐部";
    pointAnnotation4.subtitle=@"金额:¥ 788";
    [self.mapsArr addObject:pointAnnotation4];
    
    [_mapView addAnnotations:self.mapsArr];
}

-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    NSLog(@"你好，你点击了图标");
}

-(void)mapView:(BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"你想添加图标吗");
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view
{
    //点击泡泡的时候会获得获得一个上面的坐标
    self.lat=view.annotation.coordinate.latitude;
    self.lng=view.annotation.coordinate.longitude;
    NSLog(@"选中一个annotation views:%f,%f",view.annotation.coordinate.latitude,view.annotation.coordinate.longitude);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"点击确定进入手机导航，取消则停留地图页面" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

//测试阶段，经纬度和地址是手写的，后面获取的是用户的自身位置和目的地位置
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        CLLocationCoordinate2D coor1;
        
        coor1.latitude = 23.1483470000;
        coor1.longitude = 113.2680390000;
        //    coor1.latitude=self.startLocation.coordinate.latitude;
        //    coor1.longitude=self.startLocation.coordinate.longitude;
        MKMapItem *currentAction = [[MKMapItem alloc]initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coor1 addressDictionary:nil] ];
        //开始地址，设置为自己当前位置
        currentAction.name=@"广州市越秀区越秀公园";
        //currentLocation.name=self.startCityName;
        
        NSLog(@"%f,%f",self.lat,self.lng);
        CLLocationCoordinate2D coor2;
        coor2.latitude=self.lat;
        coor2.longitude=self.lng;
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coor2 addressDictionary:nil]];
        //结束位置，设置为选择的球场的地址位置
        //toLocation.name=@"好又多(棠下店)";
        //toLocation.name = self.stopAddress;
        
        NSArray *items = [NSArray arrayWithObjects:currentAction, toLocation, nil];
        NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES};
        //打开苹果自身地图应用，并呈现特定的item
        [MKMapItem openMapsWithItems:items launchOptions:options];
    }
}



@end
