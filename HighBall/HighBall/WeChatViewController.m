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
    /**
     * 微信的界面设置
     *
     *  @param pay 通知中心监听变化，然后实现视图的隐藏
     *
     *  @return 空值
     */
    
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
    /**
     *  设置image的大小
     */
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /**
     *  设置navigationbar的样式
     */
    [self.navigationController.navigationBar setBackgroundImage:self.image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar addSubview:self.arrayView];
   
   
}
- (IBAction)payButton:(UIButton *)sender {
    NSLog(@"微信接口没有接入");
    NSLog(@"%lu",(unsigned long)self.navigationController.viewControllers.count);
}
- (void)viewWillDisappear:(BOOL)animated{
    /**
     *  监听事件的实现
     */
    self.arrayView.hidden = YES;
    [super viewWillDisappear:animated];
}
- (void)dealloc{
    /**
     *  释放监听对象
     */
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"pay" object:nil];
    NSLog(@"123");
}
@end
