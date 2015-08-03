//
//  SqliteData.h
//  HighBall
//
//  Created by imac on 15-6-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BallSpellInfo.h"
#import <sqlite3.h>

@interface SqliteData : NSObject{
    sqlite3 *dataDB;
    NSString *databasePath;
}
//新建数据库
-(void)createDataBase;
//清空数据
-(void)deletDataBase;
//插入数据
-(void)saveUser:(BallSpellInfo *)ballSpellInfo;
//查询数据
-(NSArray *)findWith;

@end
