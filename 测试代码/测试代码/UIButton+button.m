//
//  UIButton+button.m
//  HighBall
//
//  Created by imac on 15-8-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UIButton+button.h"

@implementation UIButton (button)
+(UIButton *)buttonWithTitle:(NSString *)title Image:(UIImage *)image HighlightedImage:(UIImage *)highlightedImage NormalColor:(UIColor *)color selectedColor:(UIColor *)selectColor{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(image!=nil){
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:selectColor forState:UIControlStateHighlighted];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(37, 0, 5, 10)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(5, 45,18,10)];}
    else{
        [btn setTitle:title forState:UIControlStateNormal];

        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateHighlighted];
       
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return btn;
}
@end
