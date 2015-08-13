//
//  BallNavigationController.m
//  HighBall
//
//  Created by imac on 15-7-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "BallNavigationController.h"
#import "UIBarButtonItem+BarButton.h"
@interface BallNavigationController ()

@end

@implementation BallNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
+ (void)initialize{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *dicNoItem = [NSMutableDictionary dictionary];
    dicNoItem[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    dicNoItem[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [item setTitleTextAttributes:dicNoItem forState:UIControlStateDisabled];
    
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIImage *image = [UIImage imageNamed:@"blueNavi.png"];
    CGSize imageSize = self.navigationBar.bounds.size;
    image = [self scaleToSize:image size:imageSize];
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back) Image:@"navigationbar_back" HightImage:@"navigationbar_back_highlighted"];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back2) Image:@"navigationbar_more" HightImage:@"navigationbar_more_highlighted"];
    }
    [super pushViewController:viewController animated:animated];
}
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)back{
    [self popViewControllerAnimated:YES];
}
- (void)back2{
    [self popToRootViewControllerAnimated:YES];
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
