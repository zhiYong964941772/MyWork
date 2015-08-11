//
//  addressViewController.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "addressViewController.h"
#import "addressTableViewCell.h"
#import "newAddressViewController.h"
@interface addressViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation addressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收货地址";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    addressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"addressTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (IBAction)addAddress:(UIButton *)sender {
    newAddressViewController *new = [[newAddressViewController alloc]initWithNibName:@"newAddressViewController" bundle:nil];
    [self.navigationController pushViewController:new animated:YES];
    
}
@end
