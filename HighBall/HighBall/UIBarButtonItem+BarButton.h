//
//  UIBarButtonItem+BarButton.h
//  HighBall
//
//  Created by imac on 15-7-30.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButton)
+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Image:(NSString *)image HightImage:(NSString *)hightImage;
@end
