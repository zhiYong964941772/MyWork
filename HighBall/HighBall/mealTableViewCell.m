//
//  mealTableViewCell.m
//  HighBall
//
//  Created by imac on 15-8-13.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "mealTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface mealTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageShop;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation mealTableViewCell

- (void)awakeFromNib {
    self.imageShop.layer.cornerRadius = 5.0;
    self.imageShop.layer.borderWidth = 0.5;
    self.imageShop.layer.borderColor = [UIColor grayColor].CGColor;
    self.imageShop.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self.imageShop sd_setImageWithURL:[NSURL URLWithString:self.ballInfo.courseIcon] placeholderImage:nil];
    self.nameLabel.text = self.ballInfo.courseName;
   self.moneyLabel .text=[NSString stringWithFormat:@"¥ %@",self.ballInfo.price];
    
}

@end
