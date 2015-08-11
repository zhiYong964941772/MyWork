//
//  listViewController.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "listViewController.h"
#import "listTableViewCell.h"
@interface listViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end

@implementation listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"商品清单";
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    listTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"listTableViewCell" owner:self options:nil]lastObject];
    }
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
@end
