//
//  UIBarButtonItem+BarButton.m
//  HighBall
//
//  Created by imac on 15-7-30.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UIBarButtonItem+BarButton.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (BarButton)
+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Image:(NSString *)image HightImage:(NSString *)hightImage{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.size = btn.currentImage.size;
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
}

@end
