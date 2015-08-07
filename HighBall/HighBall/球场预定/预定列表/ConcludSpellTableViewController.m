//
//  ConcludSpellTableViewController.m
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ConcludSpellTableViewController.h"
#import "BallSpellAPI.h"
#import "BallSpellInfo.h"
#import "ConcludeSpellTableViewCell.h"
#import "ScheduleViewController.h"
#import "ScheduleViewController.h"
#import "MapViewController.h"
#import "SqliteData.h"

@interface ConcludSpellTableViewController ()
{
    SqliteData *_dataDB;
}
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)NSArray *ballSpellInfos;
@end

@implementation ConcludSpellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballSpellInfos=[NSArray array];
    
    _dataDB=[[SqliteData alloc]init];
    [_dataDB createDataBase];
    
    UIRefreshControl *ref=[[UIRefreshControl alloc]init];
    [ref addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    self.refreshControl=ref;
    [self initLod];
    [self initValue];
}

//布局
-(void)initLod
{
    self.tableView.tableHeaderView=self.headView;
    
    UIBarButtonItem *mapItem=[[UIBarButtonItem alloc]initWithTitle:@"地图" style:UIBarButtonItemStylePlain target:self action:@selector(mapAction)];
    mapItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=mapItem;
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=backItem;
    
    self.title=self.city;
}

-(void)initValue
{
    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        if (obj==0) {
            self.ballSpellInfos=[_dataDB findWith];
            [self.tableView reloadData];
        }else
        {
            self.ballSpellInfos=obj;
            [self.tableView reloadData];
        }
    }];
}

//下拉刷新
-(void)refreshAction
{
    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        if (obj==0) {
                [self.refreshControl endRefreshing];
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"刷新失败,请稍后再试" delegate:nil cancelButtonTitle:@"取消"   otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                self.ballSpellInfos=obj;
                [_dataDB deletDataBase];
                for (BallSpellInfo *ba in self.ballSpellInfos) {
                    [_dataDB saveUser:ba];
                }
                [self.refreshControl endRefreshing];
                [self.tableView reloadData];
            }
        }];
}

//点击跳转到地图页面，把请求的来的所有数据都传递过去，在地图页面根据传过来的数据种的球场地址在地图上定位
-(void)mapAction
{
    MapViewController *vc=[[MapViewController alloc]initWithNibName:@"MapViewController" bundle:nil];
//    NSMutableArray *arry=[NSMutableArray array];
//    for (BallSpellInfo *ball in self.ballSpellInfos) {
//        NSString *courseName=ball.courseName;
//        [arry addObject:courseName];
//    }
//    vc.mapsArr=arry;
    //NSLog(@"maparr===%@",arry);
    vc.hidesBottomBarWhenPushed=YES;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ballSpellInfos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellName=@"ConcludeSpellTableViewCell";
    ConcludeSpellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"ConcludeSpellTableViewCell" owner:self options:nil]lastObject];
    }
    cell.ballInfo=self.ballSpellInfos[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //确认预定页面
    BallSpellInfo *ballInfo=self.ballSpellInfos[indexPath.row];
    ScheduleViewController *vc=[[ScheduleViewController alloc]initWithNibName:@"ScheduleViewController" bundle:nil];
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
- (IBAction)btnBackImage:(UIButton *)sender {
    //下面红色线条的移动
    CGRect frame=self.imageView.frame;
    frame.origin.x=sender.tag*sender.frame.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.frame=frame;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
