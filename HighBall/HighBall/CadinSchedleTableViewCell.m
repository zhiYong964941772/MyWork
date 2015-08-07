//
//  CadinSchedleTableViewCell.m
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "CadinSchedleTableViewCell.h"

@implementation CadinSchedleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)cadinDaileAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cadinDaile" object:nil];
}
@end
