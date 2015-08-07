//
//  BallSpellNameTableViewController.m
//  HighBall
//
//  Created by imac on 15-5-4.
//  Copyright (c) 2015年 YM. All rights reserved.
//

//到时候通过解析得到的高尔夫球场名称，请求得到

#import "BallSpellNameTableViewController.h"
#import "BallSpellAPI.h"

@interface BallSpellNameTableViewController ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (nonatomic)int page;
@property (nonatomic, strong)NSMutableDictionary *params;
@property (nonatomic, strong)NSMutableArray *ballNames;
@property(nonatomic,strong)NSMutableArray *cityNames;
@end

@implementation BallSpellNameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLod];
    [self initValue];
}
//初始化图标，属性初始化
-(void)initLod
{
    self.params=[NSMutableDictionary dictionary];
    self.ballNames=[NSMutableArray array];
    self.cityNames=[NSMutableArray array];
    self.page=1;
    
    self.title=@"球场搜索";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backItem;
}
//通过判断本地是否存储了值
-(void)initValue
{
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSArray *cityNameArr=[ud objectForKey:@"cityBallSpellNames"];
    if (cityNameArr!=nil) {
        self.ballNames=cityNameArr.copy;
        [self.tableView reloadData];
    }else
    {
        self.ballNames=nil;
    }
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

//当searchbar中的文字发生变化时调用
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self.params setObject:searchBar.text forKey:@"keyword"];
//    [BallSpellAPI requestDealsWithParams:self.params AndCallback:^(id obj) {
//        [self.deals removeAllObjects];
//        [self.deals addObjectsFromArray:obj];
//        
//        [self.tableView reloadData];
//    }];
}

//当点击了搜索的按钮是调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.params setObject:searchBar.text forKey:@"keyword"];
//    [BallSpellAPI requestDealsWithParams:self.params AndCallback:^(id obj) {
//        self.deals = obj;
//        [self.tableView reloadData];
//    }];
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reqeustMoreData{
    [self.params setObject:[NSString stringWithFormat:@"%d",++self.page] forKey:@"page"];
    
//    [BallSpellAPI requestDealsWithParams:self.params AndCallback:^(id obj) {
//        [self.deals addObjectsFromArray:obj];
//        [self.tableView reloadData];
//    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.ballNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"DealCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DealTableViewCell" owner:self options:nil] lastObject];
    }
    cell.textLabel.text=self.ballNames[indexPath.row];
    
    if (indexPath.row == self.ballNames.count-1) {
        [self reqeustMoreData];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cityBallSpellName=self.ballNames[indexPath.row];
    [self.cityNames addObject:cityBallSpellName];
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setObject:self.cityNames forKey:@"cityBallSpellNames"];
    [ud synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
