//
//  AirViewController.m
//  HighBall
//
//  Created by imac on 15-7-28.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirViewController.h"
#import "AirFilghtView.h"
@interface AirViewController ()

@end

@implementation AirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.preferredContentSize = CGSizeMake(320, 400);
}
- (void)loadView{
    self.view = [AirFilghtView view];
    NSLog(@"123456");
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
