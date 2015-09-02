//
//  coverViewController.m
//  HighBall
//
//  Created by imac on 15-8-31.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "coverViewController.h"
#import "UIView+Extension.h"
#import "UILabel+getLabel.h"
#import "UIButton+button.h"
#import "BallTarBarViewController.h"
#define UIFrame [[UIScreen mainScreen]bounds]
@interface coverViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIPageControl *pageControl;
@end

@implementation coverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.delegate = self;
    NSArray *allImage = @[@"3770a2e114baea4209e54a461972ca4f.jpg",@"af87498441700cfeba3baa6d154c51b5.jpg",@"d1ef1a74dd24f5ef06f4364ab8516c44.jpg",@"74d938e3aea5dbe5294274b3fd6ed2b0.jpg"];
    scrollView.frame = UIFrame;
    scrollView.contentSize = CGSizeMake(scrollView.width*allImage.count, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i<allImage.count; i++) {
        UIImage *image = [UIImage imageNamed:allImage[i]];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.width = scrollView.width;
        imageView.height = scrollView.height;
        imageView.image = image;
        imageView.x = scrollView.width * i;
        imageView.y = 0;
        if (i == 0) {
            UILabel *label =  [[UILabel alloc]ofLabelWithX:20 WithY:50 WithWidth:250 WithHeight:50 WithFont:20 WithColor:[UIColor grayColor] WithText:@"你知道你的时间非常值钱"];
            UILabel *label2 =  [[UILabel alloc]ofLabelWithX:20 WithY:100 WithWidth:200 WithHeight:50 WithFont:20 WithColor:[UIColor grayColor] WithText:@"却忽略身体的价值......" ];
            label.backgroundColor = [UIColor clearColor];
            [imageView addSubview:label];
            [imageView addSubview:label2];
        }else if (i == 1){
            
            UILabel *label =  [[UILabel alloc]ofLabelWithX:scrollView.center.x-120 WithY:scrollView.height-150 WithWidth:250 WithHeight:50 WithFont:20 WithColor:[UIColor whiteColor] WithText:@"就是现在，舞动你的身体，去体现你的内心深处的冲动"];
                        label.backgroundColor = [UIColor clearColor];
            [imageView addSubview:label];
              }
        else if (i == 2){
            
            UILabel *label =  [[UILabel alloc]ofLabelWithX:scrollView.center.x-120 WithY:200 WithWidth:250 WithHeight:50 WithFont:20 WithColor:[UIColor whiteColor] WithText:@"广交朋友，让你的世界更加宽广"];
            label.backgroundColor = [UIColor clearColor];
            [imageView addSubview:label];
        }else{
            
            UILabel *label =  [[UILabel alloc]ofLabelWithX:scrollView.center.x-120 WithY:100 WithWidth:250 WithHeight:50 WithFont:20 WithColor:[UIColor whiteColor] WithText:@"一切尽在这里，高球APP，你的人生亮点"];
            label.backgroundColor = [UIColor clearColor];
            [imageView addSubview:label];
            UIButton *btn = [[UIButton alloc]buttonWithBackGroundImage:@"" HighlightedImage:@"" WithTitle:@"立即体验" WithAction:@selector(btn) Targget:self WithBackGroundColor:[UIColor whiteColor] WithX:scrollView.center.x-120 WithY:scrollView.height-150 WithWidth:250 WithHeight:50 ];            [imageView addSubview:btn];
             imageView.userInteractionEnabled = YES;
            
        }
       

        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    pageControl.center = scrollView.center;
    pageControl.numberOfPages = allImage.count;
    pageControl.y = scrollView.height-50;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageControl];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint p = scrollView.contentOffset;
    NSInteger index = p.x / scrollView.width;
    self.pageControl.currentPage = index;
}
- (void)btn{
    BallTarBarViewController *ball = [[BallTarBarViewController alloc]init];
    
    [self presentViewController:ball animated:YES completion:nil];
    
    
}
@end
