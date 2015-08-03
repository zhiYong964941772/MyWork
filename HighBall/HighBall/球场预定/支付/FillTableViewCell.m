//
//  FillTableViewCell.m
//  HighBall
//
//  Created by imac on 15-6-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "FillTableViewCell.h"
@interface FillTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *numberPerson;

@end

@implementation FillTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    self.numberPerson.text=self.number;
}

@end
