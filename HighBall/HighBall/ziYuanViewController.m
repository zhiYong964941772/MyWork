//
//  ziYuanViewController.m
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ziYuanViewController.h"
#import "foolView.h"
@interface ziYuanViewController ()

@end

@implementation ziYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"选择资源";
    foolView *fool = [[foolView alloc]init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [fool show:[defaults objectForKey:@"money"]];
    [defaults synchronize];
    [self.view addSubview:fool];
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
