//
//  GCB_ProductDetailDB.h
//  TestDemo001
//
//  Created by Waltz3D on 14-3-13.
//  Copyright (c) 2014年 Waltz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCB_ProductDetailDB : NSObject
+(id)share;

#pragma mark - ------------------创建表------

#pragma mark -创建表
-(void)CreateTable;


#pragma mark - -----------------插入-------
#pragma mark -拼接插入sql语句
-(NSString *)BuildInsertTableName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary;

#pragma mark -插入数据库操作
-(int )insertTablewithSql:(NSString *)sql;

#pragma mark - ------------------删除------
#pragma mark -删除数据库操作
-(void)DeleteTableName:(NSString *)tableName PID:(int)ID;



#pragma mark - ------------------更新------
#pragma mark -拼接更新sql语句
-(NSString *)BuildUpdateName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary  PID:(int)ID;

#pragma mark -更新数据库操作
-(void)UpdateTableWithSql:(NSString *)sql;


#pragma mark - ------------------查询------

#pragma mark -通过ID来查询数据
-(NSArray *)SelectTableName:(NSString *)tableName  PID:(int)ID;

#pragma mark -通过页码来查询数据（分页)
-(NSArray *)SelectTableName:(NSString *)tableName  startPage:(int)page;

#pragma mark -关闭数据库
-(void)closeDB;
#pragma mark-打开数据库
-(void)OpenDB;
@end
