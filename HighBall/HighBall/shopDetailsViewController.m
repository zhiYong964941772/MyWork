//
//  shopDetailsViewController.m
//  HighBall
//
//  Created by imac on 15-8-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopDetailsViewController.h"
#import "shopDetailsTableViewCell.h"
@interface shopDetailsViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *shopView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *shoeName;
@property (weak, nonatomic) IBOutlet UILabel *feature;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UILabel *judge;
@property (weak, nonatomic) IBOutlet UITableView *judgeView;
@property (strong,nonatomic) NSArray *allImage;
@property (strong,nonatomic) UIPageControl *pageControl;
@end

@implementation shopDetailsViewController
- (NSArray *)allImage{
    if (!_allImage) {
        _allImage = @[@"hallball01.jpg",@"hallball02.jpg",@"hallball03.jpg",@"hallball04.jpg"];
    }
    return _allImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self scrollViewWithrealize];
}
- (void)scrollViewWithrealize{
    CGRect frame = [[UIScreen mainScreen]bounds];
    self.scrollView.contentSize = CGSizeMake(frame.size.width*self.allImage.count, self.scrollView.frame.size.height);
    for (int i = 0; i<self.allImage.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.allImage[i]]];
        CGRect frame = [[UIScreen mainScreen]bounds];
        frame.size = CGSizeMake(frame.size.width,self.scrollView.frame.size.height );
        frame.origin = CGPointMake(i*frame.size.width, 0);
        image.frame = frame;
        [self.scrollView addSubview:image];
    }
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    pageControl.frame = CGRectMake(100, self.scrollView.frame.size.height-20, self.scrollView.frame.size.width/2, 10);
    pageControl.numberOfPages = self.allImage.count ;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.userInteractionEnabled = NO;
    [self.scrollView addSubview:pageControl];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint p = scrollView.contentOffset;
    NSUInteger index = p.x/self.scrollView.frame.size.width;
    self.pageControl.currentPage = index;
 
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shopDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"shopDetailsTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.shopView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
//鞋子的简介
- (IBAction)pingpai:(UIButton *)sender {
    NSLog(@"点我了");
    
}
//鞋子的尺寸
- (IBAction)guige:(UIButton *)sender {
    NSLog(@"点我了");
}
- (IBAction)pingjia:(UIButton *)sender {
    NSLog(@"你想说什么");
}

@end
