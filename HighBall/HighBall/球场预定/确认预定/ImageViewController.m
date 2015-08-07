//
//  ImageViewController.m
//  HighBall
//
//  Created by imac on 15-6-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ImageViewController.h"
#import "BallSpellAPI.h"
#import "UIImageView+WebCache.h"
#import "SlideImage1ViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *imageArr;
@end

@implementation ImageViewController

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
    
    self.imageArr=[NSArray array];
    self.view.backgroundColor=[UIColor whiteColor];
    [BallSpellAPI requestByCourseID:self.courseID andCallBack:^(id obj) {
        self.imageArr=obj;
        [self initLod];
    }];
}

-(void)initLod
{
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.frame;
    if ([self.imageArr count]%2==0) {
        scrollView.contentSize=CGSizeMake(scrollView.bounds.size.width, ([self.imageArr count]/2)*120+20);
    }else
    {
        scrollView.contentSize=CGSizeMake(scrollView.bounds.size.width, ([self.imageArr count]/2+1)*120+20);
    }
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    
    for (int i=0; i<self.imageArr.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i%2*(scrollView.frame.size.width-40)/2+20+i%2*10, i/2*120+10, (scrollView.frame.size.width-60)/2,110)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArr[i]] placeholderImage:nil];
        
        UIButton *imageBtn=[[UIButton alloc]initWithFrame:CGRectMake(i%2*(scrollView.frame.size.width-40)/2+20+i%2*10, i/2*120+10, (scrollView.frame.size.width-60)/2, 110)];
        imageBtn.tag=i;
        [imageBtn addTarget:self action:@selector(imageViewController:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:imageView];
        [scrollView addSubview:imageBtn];
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

-(void)imageViewController:(UIButton *)btn
{
    SlideImage1ViewController *vc=[[SlideImage1ViewController alloc]init];
    vc.imageArr=self.imageArr;
    [self.navigationController pushViewController:vc animated:YES];
//    SlideImageViewController *vc=[[SlideImageViewController alloc]initWithNibName:@"SlideImageViewController" bundle:nil];
//    vc.courseId=self.courseID;
//    vc.number=btn.tag+1;
//    [self.navigationController pushViewController:vc animated:YES];
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
