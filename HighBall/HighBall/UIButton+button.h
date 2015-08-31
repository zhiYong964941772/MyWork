//
//  UIButton+button.h
//  HighBall
//
//  Created by imac on 15-8-3.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (button)
+(UIButton *)buttonWithTitle:(NSString *)title Image:(UIImage *)image HighlightedImage:(UIImage *)highlightedImage NormalColor:(UIColor *)color selectedColor:(UIColor *)selectColor Action:(SEL)action Target:(id)target;
- (UIButton *)buttonWithBackGroundImage:(NSString *)imageStr WithTitle:(NSString *)title WithAction:(SEL)action Targget:(id)target WithBackGroundColor:(UIColor *)color WithX:(CGFloat)x WithY:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height;
@end
