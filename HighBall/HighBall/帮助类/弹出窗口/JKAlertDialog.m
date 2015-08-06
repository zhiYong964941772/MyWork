//
//  JKAlertDialog.m
//  JKAlertDialog
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//
#define AlertPadding 10
#define MenuHeight 44

#define AlertHeight 300
#define AlertWidth 260

#import "JKAlertDialog.h"
@implementation JKAlertDialogItem
@end

@implementation JKAlertDialog
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message color:(UIColor *)color andBoolen:(BOOL)boolen{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _title  = title;
        _message = message;
        _color=color;
        _boolen=boolen;
        [self buildViews:boolen];
    }
    return self;
}
- (instancetype)initWithName:(NSString *)name message:(NSString *)message color:(UIColor *)color andBoolen:(BOOL)boolen{
    
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _title  = name;
        _message = message;
        _color=color;
        _boolen=boolen;
        [self showViews:boolen];
    }
    return self;
}
-(void)showViews:(BOOL)boolens{
    //创建一个隔离的View
    self.frame = [UIScreen mainScreen].bounds;
    _coverView = [[UIView alloc]initWithFrame:self.frame];
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0;
    [self addSubview:_coverView];
    _shop = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 170)];
    _shop.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _shop.layer.cornerRadius = 5.0;
    _shop.backgroundColor = _color;
    [self addSubview:_shop];
    _labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 240, 30)];
    _labelTitle.font = [UIFont boldSystemFontOfSize:20];
    _labelTitle.textColor = [UIColor whiteColor];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    _labelTitle.numberOfLines = 0;
    _labelTitle.text=_title;
    _labelTitle.lineBreakMode = NSLineBreakByCharWrapping;
    [_shop addSubview:_labelTitle];
    
    if (boolens==YES) {
        //关闭按钮
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(210, 10, 40, 30)];
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(dissMissAction) forControlEvents:UIControlEventTouchUpInside];
        [_shop addSubview:btn];
    }


}
-(void)buildViews:(BOOL)boolen{
    //创建一个隔离的View
    self.frame = [UIScreen mainScreen].bounds;
    _coverView = [[UIView alloc]initWithFrame:self.frame];
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0;

    [self addSubview:_coverView];
    
    //初始化弹出的窗口
    //创建一个弹出框
    _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertWidth, AlertHeight)];
    _alertView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _alertView.layer.cornerRadius = 5;
    _alertView.layer.masksToBounds = YES;
    _alertView.backgroundColor =_color;
    [self addSubview:_alertView];

    //title
    _labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 240, 30)];
    _labelTitle.font = [UIFont boldSystemFontOfSize:20];
    _labelTitle.textColor = [UIColor whiteColor];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    _labelTitle.numberOfLines = 0;
    _labelTitle.text=_title;
    _labelTitle.lineBreakMode = NSLineBreakByCharWrapping;
    [_alertView addSubview:_labelTitle];
    
    if (boolen==YES) {
        //关闭按钮
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(210, 10, 40, 30)];
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(dissMissAction) forControlEvents:UIControlEventTouchUpInside];
        [_alertView addSubview:btn];
    } 
}

-(void)layoutSubviews{

    self.contentView.frame = CGRectMake(0,50,self.contentView.frame.size.width, 250);
    self.shopView.frame = CGRectMake(0,0,self.shopView.frame.size.width, self.shopView.frame.size.height);
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [_alertView addSubview:self.contentView];
    [_shop addSubview:self.shopView];
}

-(void)dissMissAction
{
    self.hidden=YES;
}

#pragma mark - show and dismiss

- (void)show {
    [UIView animateWithDuration:0.5 animations:^{
        _coverView.alpha = 0.3;

    } completion:^(BOOL finished) {
        
    }];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.subviews[0];
    [topView addSubview:self];
   [self showAnimation];
}

- (void)dismiss {
    [self hideAnimation];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeFromSuperview];
}

- (void)showAnimation {
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [_alertView.layer addAnimation:popAnimation forKey:nil];
    [_shop.layer addAnimation:popAnimation forKey:nil];

}

- (void)hideAnimation{
    [UIView animateWithDuration:0.4 animations:^{
        _coverView.alpha = 0.0;
        _alertView.alpha = 0.0;
        _shop.alpha = 0.0;
        
    } completion:^(BOOL finished) {
         [self removeFromSuperview];
    }];

    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
@end
