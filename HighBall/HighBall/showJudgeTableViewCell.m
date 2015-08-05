//
//  showJudgeTableViewCell.m
//  HighBall
//
//  Created by imac on 15-8-5.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "showJudgeTableViewCell.h"
@interface showJudgeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;
@property (weak, nonatomic) IBOutlet UIButton *gouGetButton;
@property (assign,nonatomic) NSInteger count;
@end
@implementation showJudgeTableViewCell

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gouButtons:) name:@"gouButton" object:nil];
    self.count = 1;
    
}
- (void)gouButtons:(NSNotification *)notification{
    BOOL gou = [notification.userInfo[@"selectde"]boolValue];
    self.gouGetButton.selected = gou;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)gouButton:(UIButton *)sender {
    sender.selected = !sender.selected;
   
       }
- (IBAction)jiaButton:(UIButton *)sender {
    self.count++;
    
}
- (IBAction)jianButton:(UIButton *)sender {
    self.count--;
    }
@end
