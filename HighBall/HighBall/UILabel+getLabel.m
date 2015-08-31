//
//  UILabel+getLabel.m
//  HighBall
//
//  Created by imac on 15-8-31.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UILabel+getLabel.h"

@implementation UILabel (getLabel)
- (UILabel *)ofLabelWithX:(CGFloat)x WithY:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithFont:(CGFloat)font WithColor:(UIColor *)color WithText:(NSString *)text{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.text = text;
    label.numberOfLines = 0;
    return label;
    
    
}

@end
