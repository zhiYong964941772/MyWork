//
//  PubDailTableViewCell.m
//  HighBall
//
//  Created by imac on 15-7-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "PubDailTableViewCell.h"

@implementation PubDailTableViewCell
- (IBAction)fillOutAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"fillOutAction" object:nil];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
