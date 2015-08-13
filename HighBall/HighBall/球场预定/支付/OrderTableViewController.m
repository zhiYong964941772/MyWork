//
//  OrderTableViewController.m
//  HighBall
//
//  Created by imac on 15-5-14.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "OrderTableViewController.h"
#import "OrderTableViewCell.h"
#import "BallSpellAPI.h"
#import "SpellOrderDetailViewController.h"

@interface OrderTableViewController ()
@property(nonatomic,strong)NSArray *ballInfos;
@end

@implementation OrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //根据会员的UserID，进行订单的请求
    self.ballInfos=[NSArray array];
    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        NSLog(@"%@",obj);
        self.ballInfos=obj;
        [self.tableView reloadData];
    }];
    self.tableView.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
    
    self.title=@"订单页面";
    
    //左上角返回按钮
        
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(spellOrder:) name:@"spellOrder" object:nil];
}

-(void)spellOrder:(NSNotification *)noti
{
    NSString *number=[noti.userInfo objectForKey:@"number"];
    SpellOrderDetailViewController *vc=[[SpellOrderDetailViewController alloc]initWithNibName:@"SpellOrderDetailViewController" bundle:nil];
    vc.number=number;
    [self.navigationController pushViewController:vc animated:YES];
}

//左上角返回按钮
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.ballInfos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellName=@"OrderTableViewCell";
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"OrderTableViewCell" owner:self options:nil]lastObject];
    }
    cell.bannspellInfo=self.ballInfos[indexPath.section];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpellOrderDetailViewController *vc=[[SpellOrderDetailViewController alloc]initWithNibName:@"SpellOrderDetailViewController" bundle:nil];
    vc.number=@"1";
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
