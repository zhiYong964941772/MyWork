//
//  AirFlightViewController.m
//  HighBall
//
//  Created by imac on 15-7-9.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define dateTimes @[@"00:00-06:00",@"06:00-12:00",@"12:00-18:00",@"18:00-24:00",]
#define airports @[@""]
#define airType @[@""]
#define cabinBerth @[@""]
#define airlineCompany @[@""]

#import "AirFlightViewController.h"
#import "AirFlightTableViewCell.h"
#import "CadinSchedleTableViewController.h"
#import "AirViewController.h"

@interface AirFlightViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *dayBeforeView;
@property (weak, nonatomic) IBOutlet UIView *todayView;
@property (weak, nonatomic) IBOutlet UIView *AfterDayView;

@end

@implementation AirFlightViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.title=@"航班列表";
    [self initUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)initUI
{
    self.dayBeforeView.layer.borderWidth=0.5;
    self.dayBeforeView.layer.borderColor=[UIColor darkGrayColor].CGColor;
    self.todayView.layer.borderWidth=0.5;
    self.todayView.layer.borderColor=[UIColor darkGrayColor].CGColor;
    self.AfterDayView.layer.borderWidth=0.5;
    self.AfterDayView.layer.borderColor=[UIColor darkGrayColor].CGColor;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentiFier=@"AirFlightCell";
    AirFlightTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndentiFier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"AirFlightTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CadinSchedleTableViewController *vc=[[CadinSchedleTableViewController alloc]initWithNibName:@"CadinSchedleTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)viewBtnAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            self.dayBeforeView.backgroundColor=[UIColor whiteColor];
            self.todayView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            self.AfterDayView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            break;
        case 1:
            self.todayView.backgroundColor=[UIColor whiteColor];
            self.dayBeforeView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            self.AfterDayView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            break;
        case 2:
            self.AfterDayView.backgroundColor=[UIColor whiteColor];
            self.dayBeforeView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            self.todayView.backgroundColor=[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
            break;
            
        default:
            break;
    }
}
- (IBAction)sift:(UIButton *)sender {
    
    
    
    
    AirViewController *air = [[AirViewController alloc]init];
    
    
    [self presentViewController:air animated:YES completion:nil];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
