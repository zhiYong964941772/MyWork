//
//  dingDanViewCell.m
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "dingDanViewCell.h"
@interface dingDanViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@end
@implementation dingDanViewCell

- (void)awakeFromNib {
    self.name.text = self.names;
    self.phone.text = self.phones;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}


@end
