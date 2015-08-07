//
//  shopSearchViewController.m
//  HighBall
//
//  Created by imac on 15-8-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopSearchViewController.h"
#import "cityCell.h"
#import "SearchBar.h"
#import "UIView+Extension.h"
@interface shopSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *MainTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *secondCollection;

@property (nonatomic,strong)NSArray *allshopName;
@end

@implementation shopSearchViewController
- (NSArray *)allshopName{
    if (!_allshopName) {
        _allshopName = @[@"球杆",@"球包",@"高尔夫球",@"高尔夫球鞋",@"运动服",@"附件"];
    }
    return _allshopName;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SearchBar *search = [SearchBar searchBar];
    search.width = 200;
    search.height = 30;
    self.navigationItem.titleView = search;
    self.secondCollection.backgroundColor = [UIColor whiteColor];
    [self.MainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.secondCollection registerClass:[cityCell class] forCellWithReuseIdentifier:@"collection"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return self.allshopName.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    for (int i = 0; i<self.allshopName.count; i++) {
        cell.textLabel.text  = self.allshopName[indexPath.row];
        NSLog(@"%d",i);
    }
    return cell;
 }
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    cityCell *cell = [self.secondCollection dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    cell.label.text = @"物品";
    cell.bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hallball04.jpg"]];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60, 60);

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"中了");
    
    
    
}
@end
