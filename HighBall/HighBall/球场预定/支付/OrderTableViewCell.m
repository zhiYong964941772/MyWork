//
//  OrderTableViewCell.m
//  HighBall
//
//  Created by imac on 15-5-14.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *orderHowlLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    self.nickLable.text=self.bannspellInfo.courseName;
}
- (IBAction)OrderDailsAction:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"spellOrder" object:nil userInfo:@{@"number":@"1"}];
}

@end
