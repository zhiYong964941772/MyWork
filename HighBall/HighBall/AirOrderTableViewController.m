//
//  AirOrderTableViewController.m
//  HighBall
//
//  Created by imac on 15-7-13.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirOrderTableViewController.h"
#import "AirOrderTableViewCell.h"
#import "AirOrderDetailViewController.h"

@interface AirOrderTableViewController ()

@end

@implementation AirOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(airOrderDetail:) name:@"airOrderDetail" object:nil];
}

-(void)airOrderDetail:(NSNotification *)noti
{
    AirOrderDetailViewController *vc=[[AirOrderDetailViewController alloc]initWithNibName:@"AirOrderDetailViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIndentifier=@"AirOrderTableViewCell";
    AirOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"AirOrderTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AirOrderDetailViewController *vc=[[AirOrderDetailViewController alloc]initWithNibName:@"AirOrderDetailViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

@end
