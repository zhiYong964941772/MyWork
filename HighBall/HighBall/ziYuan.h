//
//  ziYuan.h
//  HighBall
//
//  Created by imac on 15-8-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ziYuan : UIView
@property (nonatomic,strong)UILabel *money;
- (void)show:(NSInteger)money;
@property (nonatomic,strong)UILabel *zong;
@property (nonatomic,strong)UILabel *chaLabel;
@property (nonatomic,strong)UILabel *haoLabel;
@property (nonatomic,strong)UILabel *danLabel;
@end
