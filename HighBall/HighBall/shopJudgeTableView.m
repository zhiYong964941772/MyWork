//
//  shopJudgeTableView.m
//  HighBall
//
//  Created by imac on 15-8-5.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopJudgeTableView.h"
#import "showJudgeTableViewCell.h"
#import "UIView+Extension.h"
#import "JKAlertDialog.h"

@interface shopJudgeTableView ()
@property (strong, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIView *secondfootView;
@property (strong, nonatomic) IBOutlet UIView *cancelView;
@property (strong, nonatomic) JKAlertDialog *alert;
@property (strong,nonatomic) UIButton *btn;
@property (strong,nonatomic) UIView *NoView;
@end

@implementation shopJudgeTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.footView.hidden = YES;
    [self footWithView];
   self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
   self.btn.frame = CGRectMake(0, 0, 50, 50);
    [self.btn setTitle:@"编辑" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:self.btn];
    self.navigationItem.rightBarButtonItem = bar;
   }
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)btn:(UIButton *)button{
    self.footView.hidden = NO;
    [UIView animateWithDuration:1.0f animations:^{
        self.secondfootView.hidden = !self.secondfootView.hidden;
        [button setTitle:@"完成" forState:UIControlStateNormal];
        if (self.secondfootView.hidden) {
            [button setTitle:@"编辑" forState:UIControlStateNormal];
    
    }
    }];
    
}
- (void)footWithView{
    self.footView.backgroundColor = [UIColor colorWithRed:2/255.0 green:2/255.0 blue:2/255.0 alpha:0.9];
    self.title = @"购物车";
    self.secondfootView.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    showJudgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"showJudgeTableViewCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}
- (IBAction)gouButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSNumber *number = [NSNumber numberWithBool:sender.selected];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"gouButton" object:nil userInfo:@{@"selectde":number}];

    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:( UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (IBAction)cancelButton:(UIButton *)sender {
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithName:nil message:nil color:[UIColor clearColor] andBoolen:NO];
    alert.shopView = self.cancelView;
    self.alert = alert;
    [alert show];
    
    
    
}
- (IBAction)OKButton:(UIButton *)sender {
        self.alert.hidden = YES;
    [self.btn setTitle:@"编辑" forState:UIControlStateNormal];
    self.secondfootView.hidden = YES;
    UIView *fool = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds ]];
    fool.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(fool.frame.size.width/2, fool.frame.size.height/2, 280, 320)];
    label.numberOfLines = 0;
    label.text = @"您的购物车是空的";
    label.font = [UIFont systemFontOfSize:25];
    self.NoView = fool;
    [fool addSubview:label];
    
    
    [self.tableView addSubview:fool];
    
}
- (IBAction)NOButton:(UIButton *)sender {
    self.alert.hidden = YES;
    [self.btn setTitle:@"编辑" forState:UIControlStateNormal];
    self.secondfootView.hidden = YES;
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
