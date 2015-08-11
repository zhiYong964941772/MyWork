//
//  UINavigationBar+NavigationBackgroudColor.h
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (NavigationBackgroudColor)
- (void)lt_setBackgroundColors:(UIColor *)backgroundColor;
- (void)lt_setContentAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)lt_reset;
@end
