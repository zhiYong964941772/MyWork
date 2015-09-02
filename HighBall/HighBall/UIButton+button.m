//
//  UIButton+button.m
//  HighBall
//
//  Created by imac on 15-8-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UIButton+button.h"

@implementation UIButton (button)
+(UIButton *)buttonWithTitle:(NSString *)title Image:(UIImage *)image HighlightedImage:(UIImage *)highlightedImage NormalColor:(UIColor *)color selectedColor:(UIColor *)selectColor Action:(SEL)action Target:(id)target{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(image!=nil){
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateHighlighted];
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(20, -48, 0, 0)];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setImage:highlightedImage forState:UIControlStateHighlighted];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0,25,0)];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        [btn setTitle:title forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateHighlighted];
        
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [btn setBackgroundColor:[UIColor redColor]];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    }
    return btn;
    
}
- (UIButton *)buttonWithBackGroundImage:(NSString *)imageStr HighlightedImage:(NSString *)highlightedImage WithTitle:(NSString *)title WithAction:(SEL)action Targget:(id)target WithBackGroundColor:(UIColor *)color WithX:(CGFloat)x WithY:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(x, y, width, height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *image = [UIImage imageNamed:imageStr];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:35];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.userInteractionEnabled = YES;
    return btn;
    
}
@end
