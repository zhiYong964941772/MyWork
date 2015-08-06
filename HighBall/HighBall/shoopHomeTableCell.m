//
//  shoopHomeTableCell.m
//  HighBall
//
//  Created by imac on 15-7-30.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shoopHomeTableCell.h"
@interface shoopHomeTableCell()
//商品的各种属性
@property (weak, nonatomic) IBOutlet UIImageView *shoopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shoopEnglishName;
@property (weak, nonatomic) IBOutlet UILabel *shoopChinaName;
@property (weak, nonatomic) IBOutlet UILabel *shoopPrice;
@property (weak, nonatomic) IBOutlet UILabel *shoopMember;



@end
@implementation shoopHomeTableCell

- (void)awakeFromNib {
    
    
    
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
