//
//  foolView.h
//  HighBall
//
//  Created by imac on 15-8-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface foolView : UIView
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)UILabel *money;
- (void)show:(NSString *)money;
@end
