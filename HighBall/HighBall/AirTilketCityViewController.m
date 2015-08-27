//
//  AirTilketCityViewController.m
//  HighBall
//
//  Created by imac on 15-7-23.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirTilketCityViewController.h"
#import "cityCell.h"
#import "city.h"
#import "AirTicketViewController.h"

@interface AirTilketCityViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,airCitydelegate>



@property (weak, nonatomic) IBOutlet UILabel *locationLable;
@property (weak, nonatomic) IBOutlet UILabel *aimcity;
@property (weak, nonatomic) IBOutlet UICollectionView *hotCity;

@property (nonatomic,strong)NSArray *allCity;
@end

@implementation AirTilketCityViewController
//获取数据
- (NSArray *)allCity{
    if (_allCity == nil) {
        _allCity = [city allCity];
    }
    return _allCity;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    //设置代理
    AirTicketViewController *air = [[AirTicketViewController alloc]init];
    air.delegate = self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
           return self.allCity.count;
    }
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    cityCell *cell = [self.hotCity dequeueReusableCellWithReuseIdentifier:@"hot" forIndexPath:indexPath];
    //cell.bgImageView.image = [UIImage imageNamed:@"heart.png"];
    for (int i = 0; i<self.allCity.count; i++) {
       cell.label.text = self.allCity[indexPath.item];
        
    }
            return cell;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //数据持久化
    self.navigationController.navigationBarHidden = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [defaults objectForKey:@"city"];
    self.locationLable.text = str;
    self.title = @"出发城市";
//    self.navigationController.navigationBarHidden = YES;
    self.hotCity.delegate = self;
    self.hotCity.dataSource = self;
   //设置背景色和注册单元格
    self.hotCity.backgroundColor = [UIColor whiteColor];
    [self.hotCity registerClass:[cityCell class] forCellWithReuseIdentifier:@"hot"];
}
- (void)cityWithName:(NSString *)name Entrust:(AirTicketViewController *)entrust{
    self.aimcity.text = name;
}
- (IBAction)backView:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
//设置单元格的宽和高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
    
    
}
//设置单元格的位置偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(20, 20, 20, 20);
    
}
//点击产生的响应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.allCity;
    NSString *str = array[indexPath.item];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:str forKey:@"city"];
    [defaults synchronize];
   [self.navigationController popViewControllerAnimated:YES];
}
#warning mark  搜索城市的实现按钮，待完善
- (IBAction)searchButton:(UIButton *)sender {
   }
@end
