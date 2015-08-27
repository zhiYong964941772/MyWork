//
//  shopNaviViewController.m
//  HighBall
//
//  Created by imac on 15-8-1.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopNaviViewController.h"
#import "UIBarButtonItem+BarButton.h"

@interface shopNaviViewController ()
@end
@implementation shopNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+ (void)initialize{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *dicNoItem = [NSMutableDictionary dictionary];
    dicNoItem[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    dicNoItem[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:dicNoItem forState:UIControlStateDisabled];
    
    
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
     
           viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back) Image:@"navigationbar_back" HightImage:@"navigationbar_back_highlighted"];
        
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back2) Image:@"navigationbar_more" HightImage:@"navigationbar_more_highlighted"];
    
    [super pushViewController:viewController animated:animated];
    UIImage *image = [UIImage imageNamed:@"blueNavi.png"];
    CGSize imageSize = self.navigationBar.bounds.size;
    image = [self scaleToSize:image size:imageSize];
    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)back{
    if (self.viewControllers.count>1) {
        
        [self popViewControllerAnimated:YES];
       
        UIImage *image = [UIImage imageNamed:@"blueNavi.png"];
        CGSize imageSize = self.navigationBar.bounds.size;
        image = [self scaleToSize:image size:imageSize];
        self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

            }
    else{
        [self dismissViewControllerAnimated:NO completion:nil];}
}
//- (void)back2{
//    [self popToRootViewControllerAnimated:YES];
//}

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
