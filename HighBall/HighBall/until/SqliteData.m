//
//  SqliteData.m
//  HighBall
//
//  Created by imac on 15-6-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "SqliteData.h"

@implementation SqliteData

-(void)createDataBase
{
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=[dirPaths objectAtIndex:0];
    
    databasePath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"ballSpellInfos.db"]];
    NSFileManager *filemgr=[NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath]==NO) {
        const char *dbpath=[databasePath UTF8String];
        if (sqlite3_open(dbpath, &dataDB)==SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt="create table if not exists ballSpellInfos(id integer primary key,courseIcon text,courseName text,featrue text,price text)";
            if (sqlite3_exec(dataDB, sql_stmt, NULL, NULL, &errMsg)) {
                NSLog(@"数据库创建成功");
            }
        }else
        {
            NSLog(@"创建/打开数据库失败");
        }
    }
}

-(void)deletDataBase
{
    char *errorMsg;
    sqlite3_stmt *stmtment;
    const char *dbpath=[databasePath UTF8String];
    if (sqlite3_open(dbpath, &dataDB)==SQLITE_OK) {
        NSString *deletSQL=@"delete from ballSpellInfos";
        const char *delet_stmt=[deletSQL UTF8String];
        sqlite3_prepare_v2(dataDB, delet_stmt, -1, &stmtment, NULL);
        if (sqlite3_exec(dataDB, delet_stmt, NULL, NULL, &errorMsg)!=SQLITE_OK) {
            NSAssert1(0, @"Error updating tables: %s", errorMsg);
            sqlite3_free(errorMsg);
        }else
        {
            NSLog(@"删除成功");
        }
        sqlite3_finalize(stmtment);
        sqlite3_close(dataDB);
    }
}

-(void)saveUser:(BallSpellInfo *)ballSpellInfo
{
    sqlite3_stmt *stmtment;
    const char *dbpath=[databasePath UTF8String];
    if (sqlite3_open(dbpath, &dataDB)==SQLITE_OK) {
        NSString *insertSQL=[NSString stringWithFormat:@"insert into ballSpellInfos(courseIcon,courseName,featrue,price) values(\"%@\",\"%@\",\"%@\",\"%@\")",ballSpellInfo.courseIcon,ballSpellInfo.courseName,ballSpellInfo.featrue,ballSpellInfo.price];
        const char *insert_stmt=[insertSQL UTF8String];
        sqlite3_prepare(dataDB, insert_stmt, -1, &stmtment, NULL);
        if (sqlite3_step(stmtment)==SQLITE_DONE) {
            NSLog(@"已经存储到数据库");
        }else
        {
            NSLog(@"存储失败");
        }
        sqlite3_finalize(stmtment);
        sqlite3_close(dataDB);
    }
}

-(NSArray *)findWith
{
    sqlite3_stmt *stmtment;
    const char *dbpath=[databasePath UTF8String];
    NSMutableArray *array=[NSMutableArray array];
    if (sqlite3_open(dbpath, &dataDB)==SQLITE_OK) {
        NSString *querySQL=@"select * from ballSpellInfos";
        const char *query_stmt=[querySQL UTF8String];
        if (sqlite3_prepare(dataDB, query_stmt, -1, &stmtment, NULL)==SQLITE_OK) {
            while (sqlite3_step(stmtment)==SQLITE_ROW) {
                BallSpellInfo *user=[[BallSpellInfo alloc]init];
                user.courseIcon=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(stmtment, 1)];
                user.courseName=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(stmtment, 2)];
                user.featrue=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(stmtment, 3)];
                user.price=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(stmtment, 4)];
                [array addObject:user];
            }
        }
    }
    return array;
}

@end
