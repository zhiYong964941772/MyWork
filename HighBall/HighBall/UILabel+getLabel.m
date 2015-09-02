//
//  UILabel+getLabel.m
//  HighBall
//
//  Created by imac on 15-8-31.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UILabel+getLabel.h"
#import "UIView+Extension.h"
@implementation UILabel (getLabel)
- (UILabel *)ofLabelWithX:(CGFloat)x WithY:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithFont:(CGFloat)font WithColor:(UIColor *)color WithText:(NSString *)text{
    UILabel *label = [[UILabel alloc]init];
    
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.text = text;
    label.numberOfLines = 0;
    CGSize size   =   [label boundingWithRect:CGSizeMake(width, 0)];
    label.frame  =CGRectMake(x, y, size.width, size.height);

    return label;
    
    
}
- (CGSize)boundingWithRect:(CGSize)size{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize retSize = [self.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return retSize;
}
@end
