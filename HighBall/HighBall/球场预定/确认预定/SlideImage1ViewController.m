//
//  SlideImage1ViewController.m
//  HighBall
//
//  Created by imac on 15-6-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "SlideImage1ViewController.h"
#import "UIImageView+WebCache.h"

@interface SlideImage1ViewController ()

@end

@implementation SlideImage1ViewController

-(instancetype)init
{
    self=[super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initLod];
}

-(void)initLod
{
    
    
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.frame;
    
    scrollView.contentSize=CGSizeMake(scrollView.bounds.size.width*self.imageArr.count,scrollView.bounds.size.height);
    scrollView.pagingEnabled=YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    for (NSInteger i=0; i<self.imageArr.count; i++) {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(i*scrollView.bounds.size.width+20, 30,scrollView.bounds.size.width-40,scrollView.bounds.size.height-80-44)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:self.imageArr[i]] placeholderImage:nil];
        [scrollView addSubview:imageview];
    }
    [self.view addSubview:scrollView];
}

-(void)initUI
{
    self.title=@"球场图片";
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    [backItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem=backItem;
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
