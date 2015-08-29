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
#import "confirmViewController.h"
@interface shopJudgeTableView ()
@property (strong, nonatomic) IBOutlet UIView *footView;//结算删除视图
@property (weak, nonatomic) IBOutlet UIView *secondfootView;
@property (strong, nonatomic) IBOutlet UIView *cancelView;//小窗
@property (strong, nonatomic) JKAlertDialog *alert;//弹小窗
@property (strong,nonatomic) UIButton *btn;//编辑按钮
@property (strong,nonatomic) UIView *NoView;
@end

@implementation shopJudgeTableView

- (void)viewDidLoad {
    [super viewDidLoad];
        //self.footView.hidden = YES;//隐藏视图
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
//打勾
- (IBAction)gouButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSNumber *number = [NSNumber numberWithBool:sender.selected];
    //通知选择事件
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
    CGFloat w = self.cancelView.frame.size.width;
    CGFloat h = self.cancelView.frame.size.height;
    JKAlertDialog *alert = [[JKAlertDialog alloc]initWithName:@"" message:@"" color:[UIColor clearColor] andBoolen:NO AlertsWidth:w AlertsHeight:h];
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
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90,90, 280, 320)];
    label.numberOfLines = 0;
    label.text = @"您的购物车是空的";
    label.font = [UIFont systemFontOfSize:25];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, fool.frame.size.width, 44)];
    headerView.backgroundColor  = [UIColor blueColor];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(headerView.frame.size.width/2-20,headerView.frame.size.height/2-10, 80, 30)];
    label2.text = @"购物车";
    [headerView addSubview:label2];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 60, 30);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    self.NoView = fool;
    [self.NoView addSubview:label];
    [self.NoView addSubview:headerView];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.subviews[0];
    [topView addSubview:fool];
    self.tableView.hidden = YES;
    
}
- (void)back{
    NSLog(@"返回");

    
    
}
- (IBAction)NOButton:(UIButton *)sender {
    self.alert.hidden = YES;
    [self.btn setTitle:@"编辑" forState:UIControlStateNormal];
    self.secondfootView.hidden = YES;
}
- (IBAction)settleButton:(UIButton *)sender {
    confirmViewController *confirm = [[confirmViewController alloc]initWithNibName:@"confirmViewController" bundle:nil];
    [self.navigationController pushViewController:confirm animated:YES];
}









@end
