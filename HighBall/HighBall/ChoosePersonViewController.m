//
//  ChoosePersonViewController.m
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ChoosePersonViewController.h"
#import "InsertPersonViewController.h"

@interface ChoosePersonViewController ()
- (IBAction)InsertPersonAction:(id)sender;

@end

@implementation ChoosePersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"条件选择";
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

- (IBAction)InsertPersonAction:(id)sender {
    InsertPersonViewController *vc=[[InsertPersonViewController alloc]initWithNibName:@"InsertPersonViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
