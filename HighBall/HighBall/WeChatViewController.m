//
//  WeChatViewController.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "WeChatViewController.h"
#import "UINavigationBar+NavigationBackgroudColor.h"
@interface WeChatViewController ()
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)UIView *arrayView;
@end

@implementation WeChatViewController
#define frame [[UIScreen mainScreen]bounds]
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pay) name:@"weChat" object:nil];
    self.image = [UIImage imageNamed:@"blackImage"];
    CGSize imageSize = self.navigationController.navigationBar.bounds.size;
    self.image = [self scaleToSize:self.image size:imageSize];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 20)];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.text = @"确认交易";
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 2, 5, 40)];
    imageView.backgroundColor = [UIColor grayColor];
    UILabel *secondlabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, 60, 20)];
    secondlabel.font = [UIFont systemFontOfSize:15];
    secondlabel.textColor = [UIColor whiteColor];
    secondlabel.text = @"微信支付";
    self.arrayView = [[UIView alloc]initWithFrame:CGRectMake(40, 0, frame.size.width-40, 44)];
    self.arrayView.backgroundColor = [UIColor clearColor];
    [self.arrayView addSubview:label];
    [self.arrayView addSubview:secondlabel];
    [self.arrayView addSubview:imageView];

        }
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:self.image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar addSubview:self.arrayView];
   
   
}
- (IBAction)payButton:(UIButton *)sender {
    NSLog(@"微信接口没有接入");
    NSLog(@"%lu",(unsigned long)self.navigationController.viewControllers.count);
}
- (void)pay{
    self.arrayView.hidden = YES;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"pay" object:nil];
    NSLog(@"123");
}
@end
