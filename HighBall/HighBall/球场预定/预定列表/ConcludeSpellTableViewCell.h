//
//  ConcludeSpellTableViewCell.h
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

/*
 自定义Cell，用来显示查询得到的订场信息
 */

#import <UIKit/UIKit.h>
#import "BallSpellInfo.h"

@interface ConcludeSpellTableViewCell : UITableViewCell
@property(nonatomic,strong)BallSpellInfo *ballInfo;
@end
