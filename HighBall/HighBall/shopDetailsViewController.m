//
//  shopDetailsViewController.m
//  HighBall
//
//  Created by imac on 15-8-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopDetailsViewController.h"
#import "shopDetailsTableViewCell.h"
#import "UIButton+button.h"
#import "UIView+Extension.h"
#import "longShopViewController.h"
#import "judgeTableViewController.h"
#import "shopJudgeViewController.h"
@interface shopDetailsViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *shopView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *scrollFootView;
@property (weak, nonatomic) IBOutlet UILabel *shoeName;
@property (weak, nonatomic) IBOutlet UILabel *feature;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UILabel *judge;
@property (weak, nonatomic) IBOutlet UITableView *judgeView;
@property (weak, nonatomic) IBOutlet UIView *tarBarView;
@property (assign,nonatomic) NSInteger current;
@property (nonatomic,strong)NSTimer *timer;
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
    self.title = @"商品详情";
    [self scrollViewWithrealize];
    self.judgeView.tableHeaderView = self.scrollFootView;
    [self Button];
    [self addTimer];
    }
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(timerWithAction:) userInfo:nil repeats:YES];
    
    
    
}
- (void)timerWithAction:(NSTimer *)timer{
    
        [UIView animateWithDuration:1.0f animations:^{
            self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*self.current, 0);
        } completion:^(BOOL finished) {
            [self scrollViewDidEndDecelerating:self.scrollView];
        }];
    
   
    
    
    
}
- (void)deleted{
    [self.timer invalidate];
    self.timer = nil;
    self.current = 0;
}
//自定义控健
- (void)Button{
    self.tarBarView.backgroundColor = [UIColor grayColor];
    CGRect frame = [[UIScreen mainScreen]bounds];
       UIButton *lovebtn = [UIButton buttonWithTitle:@"关注" Image:[UIImage imageNamed:@"iconfont-guanzhu.png"] HighlightedImage:[UIImage imageNamed:@"iconfont-guanzhu.png"] NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor] Action:@selector(guanzhu) Target:self];
    UIButton *shopbtn = [UIButton buttonWithTitle:@"购物车" Image:[UIImage imageNamed:@"gouwuche.png"] HighlightedImage:[UIImage imageNamed:@"gouwuche.png"] NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor] Action:@selector(gouwuche) Target:self];
    UIButton *pullShop = [UIButton buttonWithTitle:@"加入购物车" Image:nil HighlightedImage:nil NormalColor:[UIColor whiteColor] selectedColor:[UIColor grayColor] Action:@selector(jiaru) Target:self];
    lovebtn.x = 0;
    lovebtn.y = 0;
    shopbtn.x = 80;
    shopbtn.y = 0;
    pullShop.x = 200;
    pullShop.y = 0;
    lovebtn.width = 100;
    lovebtn.height = 50;
    shopbtn.width = 100;
    shopbtn.height = 50;
    pullShop.width = 120;
    pullShop.height = 50;
    [self.tarBarView addSubview:lovebtn];
    [self.tarBarView addSubview:shopbtn];
    [self.tarBarView addSubview:pullShop];
    

    
}
- (void)guanzhu{
    NSLog(@"已经关注了这件商品");
}
- (void)gouwuche{
    NSLog(@"购物车");
}
- (void)jiaru{
    NSLog(@"加入购物车");
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
    [self.scrollFootView addSubview:pageControl];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   
        CGPoint p = scrollView.contentOffset;
        NSUInteger index = p.x/self.scrollView.frame.size.width;
        self.pageControl.currentPage = index;
        self.current++;
        if (self.current >self.allImage.count-1) {
            [self deleted];
            double delayInSeconds = 2.0;
                            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
                [self addTimer];
           
           
        }

    
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
    return 73;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}
//鞋子的简介
- (IBAction)pingpai:(UIButton *)sender {
    NSLog(@"点我了");
    longShopViewController *longShop = [[longShopViewController alloc]initWithNibName:@"longShopViewController" bundle:nil];
    [self.navigationController pushViewController:longShop animated:YES];
}
//鞋子的尺寸
- (IBAction)guige:(UIButton *)sender {
    shopJudgeViewController *shopJudge = [[shopJudgeViewController alloc]initWithNibName:@"shopJudgeViewController" bundle:nil];
    [self presentViewController:shopJudge animated:YES completion:nil];
}
- (IBAction)pingjia:(UIButton *)sender {
    NSLog(@"你想说什么");
    judgeTableViewController *judge = [[judgeTableViewController alloc]initWithNibName:@"judgeTableViewController" bundle:nil];
    [self.navigationController pushViewController:judge animated:YES];
}
//关注实现按钮


@end
