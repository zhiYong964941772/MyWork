//
//  UINavigationBar+NavigationBackgroudColor.m
//  HighBall
//
//  Created by imac on 15-8-11.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UINavigationBar+NavigationBackgroudColor.h"
#import <objc/runtime.h>
@implementation UINavigationBar (NavigationBackgroudColor)
static char overlayKey;
static char emptyImageKey;
- (UIView *)overlay{
    
    return objc_getAssociatedObject(self, &overlayKey);
}
- (void)setOverlay:(UIView *)overlay{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImage *)emptyImage
{
    return objc_getAssociatedObject(self, &emptyImageKey);
}
- (void)setEmptyImage:(UIImage *)image
{
    objc_setAssociatedObject(self, &emptyImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColors:(UIColor *)backgroundColor{
    if (!self.overlay) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds)+20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}
- (void)lt_setContentAlpha:(CGFloat)alpha{
    if (!self.overlay) {
        [self lt_setBackgroundColors:self.barTintColor];
    }
    [self setAlpha:alpha forSubviewsOfView:self];
}
- (void)setAlpha:(CGFloat)alpha forSubviewsOfView:(UIView *)view
{
    for (UIView *subview in view.subviews){
        if (subview == self.overlay) {
            continue;
        }
        subview.alpha = alpha;
        [self setAlpha:alpha forSubviewsOfView:subview];
    }
}
- (void)lt_reset{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}
@end