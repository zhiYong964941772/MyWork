//
//  UserViewOfTable.m
//  HighBall
//
//  Created by imac on 15-9-7.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UserViewOfTable.h"
#define UIFrame [[UIScreen mainScreen]bounds]
@interface UserViewOfTable()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *allOrder;
@property (nonatomic,strong)NSMutableArray *allBallFriend;
@property (nonatomic,strong)UITableView *tableView;
@end
@implementation UserViewOfTable
static NSString *ID = @"Cell";
- (NSMutableArray *)allOrder{
    if (_allOrder ==nil) {
        NSArray *arr = @[@"全部订单",@"球场订单",@"套餐订单",@"机票订单",@"商品订单",@"酒店订单"];
        _allOrder = [NSMutableArray arrayWithArray:arr];
    }
    return _allOrder;
}
- (NSMutableArray *)allBallFriend{
    if (!_allBallFriend) {
        _allBallFriend = [[NSMutableArray alloc]initWithObjects:@"我的球友", nil];
    }
    return _allBallFriend;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIFrame.size.width, UIFrame.size.height -400)style:UITableViewStyleGrouped];
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view.frame = CGRectMake(0, 88, UIFrame.size.width, UIFrame.size.height-400);
    [self.view addSubview:tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
       if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
       
        cell.textLabel.text = self.allOrder[0];
        
    }
    else{
        cell.textLabel.text = self.allBallFriend[0];
            }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 20;
}
@end
