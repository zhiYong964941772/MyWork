//
//  mealDetailsController.m
//  HighBall
//
//  Created by imac on 15-8-17.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "mealDetailsController.h"

@interface mealDetailsController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *rollView;

@end

@implementation mealDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"产品详情";
}
- (IBAction)ButtonStar:(UIButton *)sender {
    CGRect frame = self.rollView.frame;

    
    
    
}



@end
