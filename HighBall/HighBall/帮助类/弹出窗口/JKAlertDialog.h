//
//  JKAlertDialog.h
//  JKAlertDialog
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum ButtonType
{
    Button_OK,
    Button_CANCEL,
    Button_OTHER
    
}ButtonType;

@class JKAlertDialogItem;
typedef void(^JKAlertDialogHandler)(JKAlertDialogItem *item);


@interface JKAlertDialog : UIView
{
    UIView *_coverView;
    UIView *_alertView;
    UIView *_shop;
    UILabel *_labelTitle;
    UILabel *_labelmessage;
    
    //UIScrollView *_buttonScrollView;
    //UIScrollView *_contentScrollView;
    
    NSMutableArray *_items;
    NSString *_title;
    NSString *_message;
    BOOL _boolen;
}
//按钮宽度,如果赋值,菜单按钮宽之和,超过alert宽,菜单会滚动

@property(assign,nonatomic)CGFloat buttonWidth;
//将要显示在alert上的自定义view
@property(strong,nonatomic)UIView *contentView;
@property(nonatomic,strong)UIColor *color;
@property(nonatomic,strong)UIView *shopView;
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message color:(UIColor *)color andBoolen:(BOOL)boolen AlertsWidth:(CGFloat)width AlertsHeight:(CGFloat)height;

- (instancetype)initWithName:(NSString *)name message:(NSString *)message color:(UIColor *)color andBoolen:(BOOL)boolen AlertsWidth:(CGFloat)width AlertsHeight:(CGFloat)height;
- (void)show;
- (void)dismiss;
@end


@interface JKAlertDialogItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic) ButtonType type;
@property (nonatomic) NSUInteger tag;
@property (nonatomic, copy) JKAlertDialogHandler action;
@end