//
//  searchTableViewController.m
//  HighBall
//
//  Created by imac on 15-8-15.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "searchTableViewController.h"
#import "searchViewController.h"
#import "BallSpellAPI.h"
#import "Province.h"
#import "Citie.h"
@interface searchTableViewController ()<UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating>
@property (nonatomic,strong)searchViewController *searchResultViewController;
@property(nonatomic,strong)Province *province;
@property(nonatomic,strong)NSArray *citys;
@property (nonatomic,strong)UISearchController *searchController;
@end

@implementation searchTableViewController
static NSString *iden = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];
    self.searchResultViewController = [[searchViewController alloc]initWithNibName:@"searchViewController" bundle:nil];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchResultViewController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"城市名称";
    self.searchController.searchBar.prompt = @"请输入要查询的城市";
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.showsCancelButton = NO;
    NSArray *searchArr;
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0) {
        searchArr = [(self.searchController.searchBar.subviews[0])subviews];
    }else{
        searchArr = self.searchController.searchBar.subviews;
    }
    for (id view in searchArr) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancel = (UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            break;
        }
    }
    self.searchResultViewController.tableView.delegate = self;
    self.searchController.delegate =self;
    self.searchController.searchBar.delegate= self;
    self.definesPresentationContext = YES;
    [self initUI];
    [self initData];
    }
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    }
-(void)initData
{
    [BallSpellAPI requestByCitysCallBack:^(id obj) {
        _array=obj;
        [self.tableView reloadData];
        
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
    
    
        _array = [[NSMutableArray alloc]init];
    self.province=[[Province alloc]init];
    didSection = _array.count;
    self.tableView.tableHeaderView = self.searchController.searchBar;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    if (section==didSection) {
        self.province=_array[section];
        return self.province.cities.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
        NSString *str=nil;
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
        
    }
    Province *p=_array[didSection];
    Citie *citi=p.cities[indexPath.row];
    str=citi.cityName;
    cell.textLabel.text =str;
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
    [self.tableView beginUpdates];
    ifOpen=firstDoInsert;
    NSMutableArray *rowToInsert=[[NSMutableArray alloc]init];
    
    self.province=_array[didSection];
    for (int i=0; i<self.province.cities.count; i++) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:i inSection:didSection];
        [rowToInsert addObject:indexPath];
    }
    
    if (!ifOpen) {
        didSection=_array.count+1;
        [self.tableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else
    {
        [self.tableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView endUpdates];
    if (nextDoInsert) {
        didSection=endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *searchText = searchController.searchBar.text;
    NSInteger index = self.searchController.searchBar.selectedScopeButtonIndex;
    NSLog(@"%ld",(long)index);
    NSMutableArray *searchResults = [NSMutableArray array];
    for (NSString *p in self.citys) {
        //查看字符串B在A中出现的位置，及占用的长度
        //ABCDE->BCD     location=1 length=3
        NSRange range = [p rangeOfString:searchText];
        if (range.length>0 ) {
            [searchResults addObject:p];
        }
    }
    
    self.searchResultViewController.resultArray = searchResults;
    [self.searchResultViewController.tableView reloadData];
}


@end
