//
//  cityCell.m
//  HighBall
//
//  Created by imac on 15-7-23.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "cityCell.h"

@implementation cityCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        //先设置背景图
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        //创建的图片视图成为背景视图
        self.backgroundView = self.bgImageView;
        //创建标签
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
        self.userInteractionEnabled = YES;
            }
    return self;
}
@end
