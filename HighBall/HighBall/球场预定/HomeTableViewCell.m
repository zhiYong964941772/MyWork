//
//  HomeTableViewCell.m
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface HomeTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *judgeLable;
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet UILabel *highReturen;


@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    self.headImageView.layer.cornerRadius=5;
    self.headImageView.layer.borderWidth=0.5;
    self.headImageView.layer.borderColor=[UIColor grayColor].CGColor;
    self.headImageView.layer.masksToBounds=YES;
}
//重新渲染tableView
-(void)layoutSubviews
{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:self.ballInfo.courseIcon] placeholderImage:nil];
    
    self.nickLable.text=self.ballInfo.courseName;
    self.judgeLable.text=self.ballInfo.featrue;
    self.moneyLable.text=[NSString stringWithFormat:@"¥ %@",self.ballInfo.price];
    //最高返回多少
    //self.highReturen.text=[NSString stringWithFormat:@"最高返 %@"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
