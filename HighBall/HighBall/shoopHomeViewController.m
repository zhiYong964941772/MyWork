//
//  shoopHomeViewController.m
//  HighBall
//
//  Created by imac on 15-7-22.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shoopHomeViewController.h"
#import "shoopHomeTableCell.h"
#import "SearchBar.h"
#import "UIView+Extension.h"
#import "shopDetailsViewController.h"
@interface shoopHomeViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shoopHomeTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *shoopScrollView;
@property (weak, nonatomic) IBOutlet UIView *shoopHotView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong,nonatomic) NSArray *array;//假数据
@property (strong,nonatomic) NSTimer *timer;
@property (assign,nonatomic) NSInteger currentTime;
@end

@implementation shoopHomeViewController
- (NSArray *)array{
    if (!_array) {
        _array = @[@"hallball01.jpg",@"hallball02.jpg",@"hallball03.jpg",@"hallball04.jpg"];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//添加搜索框
    SearchBar *searchBar = [SearchBar searchBar];
    searchBar.width = 200;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
    
         [self addTimer];//添加定时循环事件
   
    
    
    
   }
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(scrollViewImage:) userInfo:nil repeats:YES];//初始化一个循环
    
        [self scrollView];
    
   
    

}
//添加动画
- (void)scrollViewImage:(NSTimer *)timer{
    [UIView animateWithDuration:1.0f animations:^{
        self.shoopScrollView.contentOffset = CGPointMake(self.shoopScrollView.frame.size.width*self.currentTime, 0);
        
    } completion:^(BOOL finished) {
        [self scrollViewDidEndDecelerating:self.shoopScrollView];
    }];
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint p = scrollView.contentOffset;//获取视图偏移的原点位置坐标
    NSUInteger index = p.x/self.shoopScrollView.frame.size.width;
    self.pageControl.currentPage = index;//设置小圆点的位置
    self.currentTime ++;
    if (self.currentTime >self.array.count-1) {
        [self deleteTimer];
        
        [self.shoopScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        [self addTimer];
    }
}
//删除循环
- (void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
    self.currentTime = 0;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
       self.shoopHomeTableView.delegate = self;
    self.shoopHomeTableView.dataSource =self;
    
}
//设置滚动视图和小圆点
- (void)scrollView{
       self.shoopScrollView.delegate = self;
    CGRect frame = [[UIScreen mainScreen]bounds];
    
    self.shoopScrollView.contentSize = CGSizeMake((frame.size.width-20)*self.array.count, self.shoopScrollView.frame.size.height);//设置滚动的范围
    //添加图片
    for (int i = 0; i< self.array.count;i++ ) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.array[i]]];
        CGRect frame = [[UIScreen mainScreen]bounds];
        frame.size = CGSizeMake(frame.size.width-20, self.shoopScrollView.frame.size.height);
        frame.origin = CGPointMake(i*frame.size.width, 0);
        image.frame = frame;
        [self.shoopScrollView addSubview:image];
        
    }
    self.shoopScrollView.bounces = NO;//设置图片不跳动
    self.shoopScrollView.pagingEnabled = YES;//设置视图整页滚动
    self.shoopScrollView.showsHorizontalScrollIndicator = NO;//设置水平滚动不可见
    UIPageControl *pageConrtrol = [[UIPageControl alloc]init];
    self.pageControl = pageConrtrol;
    pageConrtrol.frame = CGRectMake(200, self.shoopHotView.frame.size.height-20, self.shoopHotView.frame.size.width/2, 10);
    pageConrtrol.numberOfPages = self.array.count;//设置圆点的个数
    pageConrtrol.pageIndicatorTintColor = [UIColor blackColor];//设置圆点的正常状态的颜色
    pageConrtrol.currentPageIndicatorTintColor = [UIColor redColor];//设置圆点的选中状态的颜色
    pageConrtrol.userInteractionEnabled = NO;
    [self.shoopHotView addSubview:pageConrtrol];
    
 }
// 视图滚动后调用的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shoopHomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"shoopHomeTableCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}
//设置栏目视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.shoopHotView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    shopDetailsViewController *shop = [[shopDetailsViewController alloc]initWithNibName:@"shopDetailsViewController" bundle:nil];
    shop.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shop animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}



@end
