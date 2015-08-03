//
//  shopTableViewCell.m
//  HighBall
//
//  Created by imac on 15-7-31.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "shopTableViewCell.h"
@interface shopTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *englishName;
@property (weak, nonatomic) IBOutlet UILabel *chinaName;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceVip;

@end
@implementation shopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
