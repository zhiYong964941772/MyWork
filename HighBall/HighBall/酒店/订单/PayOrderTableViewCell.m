//
//  PayOrderTableViewCell.m
//  HighBall
//
//  Created by imac on 15-7-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PayOrderTableViewCell.h"
#import "OrderDetailsViewController.h"

@interface PayOrderTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *orderHowlLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end


@implementation PayOrderTableViewCell
- (IBAction)btnAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"orderAction" object:nil];
}

//控件赋值操作
-(void)layoutSubviews
{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
