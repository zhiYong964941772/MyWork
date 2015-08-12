//
//  BallSpellCityViewController.m
//  HighBall
//
//  Created by imac on 15-6-16.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#import "BallSpellCityViewController.h"
#import "BallSpellAPI.h"
#import "Province.h"
#import "Citie.h"

@interface BallSpellCityViewController ()<UISearchBarDelegate,UISearchResultsUpdating>
@property(nonatomic,strong)Province *province;

@property (weak, nonatomic) IBOutlet UIView *headerview;

@property(nonatomic,strong)NSArray *citys;
@property(nonatomic,strong)NSMutableArray *searchResuls;
@property(nonatomic,strong)UISearchController *searchController;
@property(nonatomic, strong)UITableViewController *searchTVC;

@end

@implementation BallSpellCityViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    self.searchResuls=[NSMutableArray array];
    [mainTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"maincell"];
    [self.searchTVC.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"searchCell"];
    [self initUI];
    [self initData];
}

-(void)initData
{
    [BallSpellAPI requestByCitysCallBack:^(id obj) {
        _array=obj;
        [mainTable reloadData];
        
        NSMutableArray *arr=[NSMutableArray array];
        for (Province *p in _array) {
            for (Citie *c in p.cities) {
                NSString *cityName=c.cityName;
                [arr addObject:cityName];
            }
        }
        self.citys=arr;
    }];
}

-(void)initUI
{
    self.navigationController.navigationBarHidden=NO;
    
    
    
    mainTable.delegate = self;
    mainTable.dataSource = self;
    _array = [[NSMutableArray alloc]init];
    self.province=[[Province alloc]init];
    didSection = _array.count;
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==mainTable) {
        return _array.count;
    }else
    {
        return 1;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==mainTable) {
        if (section==didSection) {
            self.province=_array[section];
            return self.province.cities.count;
        }
        return 0;
    }else
    {
        return self.searchResuls.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *str=nil;
    if (tableView==mainTable) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"maincell"];
        Province *p=_array[didSection];
        Citie *citi=p.cities[indexPath.row];
        str=citi.cityName;
    }else
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
        str=self.searchResuls[indexPath.row];
    }
    cell.textLabel.text=str;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==mainTable) {
        Province *p=_array[didSection];
        Citie *citi=p.cities[indexPath.row];
        //    NSString *cityID=citi.cityId;
        NSString *cityName=citi.cityName;
        NSArray *citys=[cityName componentsSeparatedByString:@"市"];
        NSString *city=citys.firstObject;
        NSLog(@"%@",city);
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:city forKey:@"city"];
        //    [ud setObject:cityID forKey:@"cityID"];
        [ud synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        NSString *cityName=self.searchResuls[indexPath.row];
        NSArray *citys=[cityName componentsSeparatedByString:@"市"];
        NSString *city=citys.firstObject;
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:city forKey:@"city"];
        [ud synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==didSection) {
        return 40;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *myView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 40)];
    [myView setBackgroundColor:[UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0]];
    if (tableView==mainTable) {
        self.province=_array[section];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 250, 25)];
        lable.font=[UIFont systemFontOfSize:17];
        lable.textColor=[UIColor blackColor];
        lable.text=self.province.provinceName;
        [myView addSubview:lable];
        
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 39,self.view.frame.size.width, 1)];
        img.backgroundColor=[UIColor grayColor];
        [myView addSubview:img];
        
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [bt setFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [bt setTag:section];
        [bt.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [bt.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [bt.titleLabel setTextColor:[UIColor blueColor]];
        [bt addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
        [myView addSubview:bt];
    }else
    {
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 250, 25)];
        lable.font=[UIFont systemFontOfSize:17];
        lable.textColor=[UIColor grayColor];
        lable.text=@"搜索得到的城市";
        [myView addSubview:lable];
    }
    return myView;
}

-(void)addCell:(UIButton *)bt
{
    endSection=bt.tag;
    if (didSection==_array.count+1) {
        ifOpen=NO;
        didSection=endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }else
    {
        if (didSection==endSection) {
            [self didSelectCellRowFirstDo:NO nextDo:NO];
        }else
        {
            [self didSelectCellRowFirstDo:NO nextDo:YES];
        }
    }
}

- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    [mainTable beginUpdates];
    ifOpen=firstDoInsert;
    NSMutableArray *rowToInsert=[[NSMutableArray alloc]init];
    
    self.province=_array[didSection];
    for (int i=0; i<self.province.cities.count; i++) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:i inSection:didSection];
        [rowToInsert addObject:indexPath];
    }
    
    if (!ifOpen) {
        didSection=_array.count+1;
        [mainTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else
    {
        [mainTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [mainTable endUpdates];
    if (nextDoInsert) {
        didSection=endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    [mainTable scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}


- (IBAction)searchAction:(id)sender {
    //初始化搜索
    if (!_searchTVC) {
        _searchTVC = [[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
    }
    self.searchTVC.tableView.dataSource = self;
    self.searchTVC.tableView.delegate = self;
    //创建搜索控制器
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchTVC];
    //当搜索框中的内容发生变化时，由谁来处理
    self.searchController.searchResultsUpdater = self;
    //提示信息
    self.searchController.searchBar.placeholder = @"城市名称";
    self.searchController.searchBar.prompt = @"请输入要查询的城市";
    //展示搜索控制器
    [self presentViewController:self.searchController animated:YES completion:nil];
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *contenStr=searchController.searchBar.text;
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *p in self.citys) {
        //查看字符串B在A中出现的位置，及占用的长度
        //ABCDE->BCD     location=1 length=3
        NSRange range = [p rangeOfString:contenStr];
        if (range.length>0 ) {
            [array addObject:p];
        }
    }
    self.searchResuls = array;
    [self.searchTVC.tableView reloadData];
}
@end
