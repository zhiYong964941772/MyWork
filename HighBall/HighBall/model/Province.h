//
//  Province.h
//  HighBall
//
//  Created by imac on 15-5-21.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property(nonatomic,copy)NSString *provinceId;//省份ID
@property(nonatomic,copy)NSString *provinceName;//省份名称
@property(nonatomic,strong)NSMutableArray *cities;//下面所包含的市区

@end
