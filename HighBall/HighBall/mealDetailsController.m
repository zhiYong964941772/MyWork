//
//  mealDetailsController.m
//  HighBall
//
//  Created by imac on 15-8-17.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "mealDetailsController.h"
#import "SecondTableViewCell.h"
@interface mealDetailsController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIImageView *rollView;
@property (weak, nonatomic) IBOutlet UITableView *MainView;
@property (weak, nonatomic) IBOutlet UITableView *secondView;

@property (strong, nonatomic) IBOutlet UITableViewCell *oneCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *twoCell;
#define frameSize [[UIScreen mainScreen]bounds]
@end

@implementation mealDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"产品详情";
   
    
   
    
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
       }
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
            return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.MainView) {
        return 1;
    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//   static NSString *str = @"Cell";
        if (tableView == self.MainView) {
        if (indexPath.section == 0) {
            
                       return self.oneCell;
        }else{
            
            return self.twoCell;
        }
    }else{
        SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SecondTableViewCell" owner:self options:nil]lastObject];
        }
        return cell;
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.MainView) {
        if (indexPath == 0) {
            return 216;
        }else{
            return 150;
        }
    }else{
        return 175;
    }
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
       if (tableView == self.secondView) {
           UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frameSize.size.width, 20)];
           view.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];

        if (section == 0) {
            UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-hongdian"]];
            image.frame = CGRectMake(5, 10, 10, 10);
            [view addSubview:image];
            UILabel *oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 20)];
            oneLabel.font = [UIFont fontWithName:@"黑体-简" size:15];
            oneLabel.text = @"第一天";
            [view addSubview:oneLabel];
            UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 100, 20)];
            addressLabel.font = [UIFont systemFontOfSize:15];
            addressLabel.text = @"抵达某地";
            addressLabel.textColor = [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0];
            
            [view addSubview:addressLabel];
            return view;
        }else{
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-hongdian"]];
        image.frame = CGRectMake(5, 10, 10, 10);
            [view addSubview:image];
            UILabel *oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 20)];
            oneLabel.font = [UIFont fontWithName:@"黑体-简" size:15];
            oneLabel.text = @"第二天";
            [view addSubview:oneLabel];
            UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, 50, 20)];
            addressLabel.font = [UIFont systemFontOfSize:15];
            addressLabel.text = @"晒太阳";
            addressLabel.textColor = [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1.0];
            [view addSubview:addressLabel];
            return view;

        }
    
       }else{
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frameSize.size.width, -40)];
           image.backgroundColor = [UIColor grayColor];
    return image;
       }
    }

- (IBAction)ButtonStar:(UIButton *)sender {
    CGRect frame = self.rollView.frame;
    frame.origin.x = frame.size.width*sender.tag;
    [UIView animateWithDuration:0.5 animations:^{
        self.rollView.frame = frame;
    }];
    switch (sender.tag) {
        case 0:
            
            self.MainView.hidden = NO;
                      break;
            
        case 1:
            
            self.MainView.hidden = YES;
            
            break;
    }
    
    
    
}
//预定
- (IBAction)appointmentBtn:(UIButton *)sender {
    NSLog(@".....");
}



@end
