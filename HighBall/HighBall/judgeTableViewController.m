//
//  judgeTableViewController.m
//  HighBall
//
//  Created by imac on 15-8-4.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "judgeTableViewController.h"
#import "shopDetailsTableViewCell.h"
@interface judgeTableViewController ()

@end

@implementation judgeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价详情";
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shopDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"shopDetailsTableViewCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}



@end
