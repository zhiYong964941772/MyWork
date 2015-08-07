//
//  HomeTableViewCell.h
//  HighBall
//
//  Created by imac on 15-4-24.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BallSpellInfo.h"

@interface HomeTableViewCell : UITableViewCell
//模型层的一个数据模型，根据Cell传过来的值，具体显示在首页的tableView中
@property(nonatomic,strong)BallSpellInfo *ballInfo;
@end
