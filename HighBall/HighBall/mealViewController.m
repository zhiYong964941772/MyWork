//
//  mealViewController.m
//  HighBall
//
//  Created by imac on 15-8-13.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "mealViewController.h"
#import "mealTableViewCell.h"
#import "SqliteData.h"
#import "BallSpellInfo.h"
#import "BallSpellAPI.h"
@interface mealViewController ()<UITableViewDelegate,UITableViewDataSource>{
    SqliteData *_dbData;
}

@property (strong, nonatomic) IBOutlet UIView *mobileTableView;
@property (weak, nonatomic) IBOutlet UIImageView *mobileView;
@property (weak, nonatomic) IBOutlet UITableView *mealTableView;
@property (strong,nonatomic) NSArray *ballSpellInfos;
@property (strong,nonatomic) UIRefreshControl *refreshControl;
@end

@implementation mealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationController.navigationBarHidden = NO;
    self.ballSpellInfos = [NSArray array];
    _dbData = [[SqliteData alloc]init];
    [_dbData createDataBase];
    self.title = @"套餐";
    /**
     *  下拉刷新
     */
    UIRefreshControl *ref = [[UIRefreshControl alloc]init];
    [ref addTarget:self action:@selector(refreshActionMeal ) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = ref;
    [self loadButton];
    
    self.mealTableView.tableHeaderView = self.mobileTableView;
    
}
- (void)loadButton{
       UIBarButtonItem *mapItem=[[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(cityButton)];
    mapItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=mapItem;

    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        if (obj == 0) {
            self.ballSpellInfos = [_dbData findWith];
            [self.mealTableView reloadData];
        }else{
            self.ballSpellInfos = obj;
            [self.mealTableView reloadData];
        }
    }];
}
- (void)refreshActionMeal{
    [BallSpellAPI requestByCity:@"" dateTime:@"" courseName:@"" andCallback:^(id obj) {
        if (obj == 0) {
            [self.refreshControl endRefreshing];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"刷新失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else{
            self.ballSpellInfos = obj;
            [_dbData deletDataBase];
            for (BallSpellInfo *ba in self.ballSpellInfos) {
                [_dbData  saveUser:ba];
                
            }
            [self.refreshControl endRefreshing];
            [self.mealTableView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ballSpellInfos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    mealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"mealTableViewCell" owner:self options:nil]lastObject];
    }
    cell.ballInfo = self.ballSpellInfos[indexPath.row];
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

//综合//价格
- (IBAction)synthesizeBtn:(UIButton *)sender {
    CGRect frame = self.mobileView.frame;
    frame.origin.x = sender.tag *frame.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        self.mobileView.frame = frame;
    }];
}
//价格
//城市的搜索
- (void)cityButton{
    NSLog(@"搜索城市");
}

@end
