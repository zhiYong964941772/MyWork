//
//  ConcludeSpellTableViewCell.m
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "ConcludeSpellTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ConcludeSpellTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *standardLable;
@property (weak, nonatomic) IBOutlet UILabel *judgeLable;
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;


@end

@implementation ConcludeSpellTableViewCell

- (void)awakeFromNib {
    self.headImageView.layer.cornerRadius=5;
    self.headImageView.layer.borderWidth=0.5;
    self.headImageView.layer.borderColor=[UIColor grayColor].CGColor;
    self.headImageView.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.ballInfo.courseIcon] placeholderImage:nil];

    self.nickLable.text=self.ballInfo.courseName;
    self.standardLable.text=self.ballInfo.introduction;
    self.judgeLable.text=self.ballInfo.featrue;
    self.moneyLable.text=[NSString stringWithFormat:@"¥ %@",self.ballInfo.price];
    

    // Configure the view for the selected state
}

@end
