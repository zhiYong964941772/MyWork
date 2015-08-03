//
//  AirOrderTableViewCell.m
//  HighBall
//
//  Created by imac on 15-7-13.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirOrderTableViewCell.h"

@implementation AirOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)AirOrderDatileAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"airOrderDetail" object:nil];
}

@end
