//
//  addressTableViewCell.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "addressTableViewCell.h"
@interface addressTableViewCell()
@property (strong,nonatomic)UIButton *button;
@end
@implementation addressTableViewCell

- (void)awakeFromNib {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = [[UIScreen mainScreen]bounds];
    btn.frame  = CGRectMake(0, 0, frame.size.width, 100);
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:[UIImage imageNamed:@"iconfont-checked.png"] forState:UIControlStateSelected];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(30, 300, 30, 0)];
    [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    self.button = btn;
    [self addSubview:btn];


}
- (void)btn:(UIButton *)btn{
    btn.selected = !btn.selected;
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
