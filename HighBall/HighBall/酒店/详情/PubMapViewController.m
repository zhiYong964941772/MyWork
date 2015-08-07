//
//  PubMapViewController.m
//  HighBall
//
//  Created by imac on 15-7-7.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PubMapViewController.h"

@interface PubMapViewController (){
    
    IBOutlet BMKMapView *_mapView;
}
@property(nonatomic)float lat;
@property(nonatomic)float lng;
@property(nonatomic,strong)NSMutableArray *mapsArr;
@end

@implementation PubMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPointAnnotation];
    [_mapView setZoomLevel:12];
    
    self.title=@"地图";
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate=self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate=nil;
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
    self.lng=view.annotation.coordinate.longitude;   NSLog(@"选中一个annotation views:%f,%f",self.lat,self.lng);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"点击确定进入手机导航，取消则停留地图页面" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

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
        

        CLLocationCoordinate2D coor2;
        coor2.latitude=self.lat;
        coor2.longitude=self.lng;
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coor2 addressDictionary:nil]];
        
        //结束位置，设置为选择的球场的地址位置
        toLocation.name=@"好又多(棠下店)";
        //toLocation.name = self.stopAddress;
        
        NSArray *items = [NSArray arrayWithObjects:currentAction, toLocation, nil];
        NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES};
        //打开苹果自身地图应用，并呈现特定的item
        [MKMapItem openMapsWithItems:items launchOptions:options];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
