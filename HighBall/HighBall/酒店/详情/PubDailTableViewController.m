//
//  PubDailTableViewController.m
//  HighBall
//
//  Created by imac on 15-7-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PubDailTableViewController.h"
#import "PubDailTableViewCell.h"
#import "PubInformationViewController.h"
#import "FillOutOrderViewController.h"
#import "PubMapViewController.h"

@interface PubDailTableViewController ()

@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell3;

@end

@implementation PubDailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fillOutAction) name:@"fillOutAction" object:nil];
    self.title=@"酒店详情";
}

-(void)fillOutAction
{
    FillOutOrderViewController *vc=[[FillOutOrderViewController alloc]initWithNibName:@"FillOutOrderViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else if (section==1)
    {
        return 2;
    }else
    {
        return 20;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIndentifier=@"temoroCell";
    if (indexPath.section==0) {
        return self.cell1;
    }else if(indexPath.section==1)
    {
        if (indexPath.row==0) {
            return self.cell2;
        }else
        {
            return self.cell3;
        }
    }else
    {
        if (indexPath.row==0) {
            UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            cell.textLabel.text=@"明天";
            cell.textLabel.font=[UIFont fontWithName:@"黑体-简" size:20];
            UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(60, 14, 150, 20)];
            lable.text=@"入住1晚";
            lable.font=[UIFont fontWithName:@"黑体-简" size:15];
            [cell.contentView addSubview:lable];
            return cell;
        }
        else
        {
            PubDailTableViewCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"PubDailTableViewCell" owner:nil options:nil]lastObject];
            return cell;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 140;
    }else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            return 44;
        }else
        {
            return 69;
        }
        
    }else
    {
        if (indexPath.row==0) {
            return 44;
        }else
        {
            return 100;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else if (section==1)
    {
        return 10;
    }else
    {
        return 10;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            //跳转到地图界面
            PubMapViewController *vc=[[PubMapViewController alloc]initWithNibName:@"PubMapViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }else
        {
            //跳转到详情界面
            PubInformationViewController *vc=[[PubInformationViewController alloc]initWithNibName:@"PubInformationViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else
    {
        if (indexPath.row!=0) {
            //跳转到房间界面
            FillOutOrderViewController * vc=[[FillOutOrderViewController alloc]initWithNibName:@"FillOutOrderViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}
- (IBAction)pubMapAction:(id)sender {
    //跳转到地图界面
    PubMapViewController *vc=[[PubMapViewController alloc]initWithNibName:@"PubMapViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pubInformAction:(id)sender {
    PubInformationViewController *vc=[[PubInformationViewController alloc]initWithNibName:@"PubInformationViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
