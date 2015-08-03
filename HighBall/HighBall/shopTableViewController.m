//
//  shopTableViewController.m
//  HighBall
//
//  Created by imac on 15-8-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopTableViewController.h"
#import "shopTableViewCell.h"
@interface shopTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shopTableView;

@end

@implementation shopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopTableView.delegate = self;
    self.shopTableView.dataSource = self;
    
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
    shopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
    cell=[[[NSBundle mainBundle]loadNibNamed:@"shopTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

@end
