//
//  GCB_ProductDetailDB.m
//  TestDemo001
//
//  Created by Waltz3D on 14-3-13.
//  Copyright (c) 2014年 Waltz. All rights reserved.
//

#import "GCB_ProductDetailDB.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"
//#import "GCB_Product.h"

#define  DB_PAGESIZE 50


@interface GCB_ProductDetailDB ()
{
    FMDatabase *_db;
}

@end

@implementation GCB_ProductDetailDB


+(id)share{
    static dispatch_once_t onceToken;
    static GCB_ProductDetailDB *db=nil;
    dispatch_once(&onceToken, ^{
        db=[[GCB_ProductDetailDB alloc] init];
    });
    return db;
}


#pragma mark -关闭数据库
-(void)closeDB{
    [_db close];
}

#pragma mark-打开数据库
-(void)OpenDB{
    [_db close];
    [_db open];
}

//===================创建表=======================
#pragma mark -创建数据库
-(void)CreateTable{
    NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    docs=[docs stringByAppendingPathComponent:@"Boee.db"];
    NSLog(@"--->doc=%@",docs);
    
    _db=[FMDatabase databaseWithPath:docs];
//    _db=[_db retain];
    [_db open];
    
    //现货
//    if (![_db tableExists:@"SpotProduce"]) {
//        NSArray *propertys=@[
//                               @"ParentID"//分类ID
//                              ,@"ProductName"//品名
//                              ,@"ProductNum"//款号
//                              ,@"ProductCode"//条码
//                              ,@"ProductSize"//尺寸（具体数值）
//                              ,@"ProductPrice"//价格
//                              ,@"ProductPhoto"//大图
//                              ,@"AdPhoto"//南渄美钻广告图
//                              ,@"Description"//商品描述
//                              ,@"ProductType"//产品系列  ID（下单：1，现贷：2）
//                              ,@"Weigth"//产品重量
//                              ,@"Suttle"//净金重
//                              ,@"SetModel"//镶石类型
//                              ,@"Stuff"//材质（成色）
//                              ,@"ProductColor"//产品颜色
//                              ,@"Imprint"//字印
//                              ,@"Remark"//备注
//                              ,@"JoinDate"//最后更新时间
//                              ,@"JoinIP"//最后更新IP
//                              ,@"SubIntro"//副石集合
//                              ,@"Introduce"//主石集合
//                   ];
//        
//      
//
//       [self BuildCreateSqlWithTable:@"SpotProduce" Propertys:propertys];
//        
//    }
//    //下单产品
//    if (![_db tableExists:@"OrderProduce"]) {
//        NSArray *propertys=@[
//                               @"ParentID"//分类ID
//                              ,@"ProductName"//品名
//                              ,@"ProductNum"//款号
//                              ,@"ProductPhoto"//大图
//                              ,@"Description"//商品描述
//                              ,@"ProductType"//产品系列（下单：1，现贷：2）
//                              ,@"WeigthRange"//重量区间
//                              ,@"Remark"//备注
//                              ,@"JoinDate"//最后更新时间
//                              ,@"JoinIP"//最后更新IP
//                             ,@"DiamondIntr"
//                             
//                             ];
//                [self BuildCreateSqlWithTable:@"OrderProduce" Propertys:propertys];
//    }
//    
//    
//    //分类
//    if (![_db tableExists:@"ProduceCategory"]) {
//        NSArray *propertys=@[
//                             @"ID",
//                             @"ParentID",
//                             @"CatName",
//                             @"CatPhoto",
//                             @"Language"
//                             
//                             ];
//        [self BuildCreateSqlWithTable:@"ProduceCategory" Propertys:propertys];
//    }
//    
//    //南非美钻
//    if (![_db tableExists:@"SouthDiamond"]) {
//        NSArray *propertys=@[
//                             @"Attr1",
//                             @"Attr2",
//                             @"AttrDescript",
//                             @"AttrName",
//                             @"AttrPhoto",
//                             @"Id",
//                             @"NodePath",
//                             @"ParentId"
//                             ];
//        [self BuildCreateSqlWithTable:@"SouthDiamond" Propertys:propertys];
//    }
}

#pragma mark -创建表
-( void)BuildCreateSqlWithTable:(NSString *)tableName Propertys:(NSArray *)propertys{
    NSMutableString *sql=[NSMutableString string];
    [sql appendFormat:@"CREATE TABLE %@ (PID INTEGER PRIMARY KEY AUTOINCREMENT,",tableName];
    for (int i=0; i<propertys.count; i++) {
        if (i==propertys.count-1) {
            [sql appendFormat:@"%@ text)",propertys[i]];
        }
        else  [sql appendFormat:@"%@ text,",propertys[i]];
    }
    BOOL flag= [_db executeUpdate:sql ];
    
    if (flag) NSLog(@"create table %@ sucess",tableName);
    else NSLog(@"create table %@ failed",tableName);

    
    
}



//===================删除=======================
#pragma mark -删除sql操作
//ID 等于0 删除所有表
-(void)DeleteTableName:(NSString *)tableName PID:(int)ID{
    if(ID==0){
        NSString *sql=[NSString stringWithFormat:@"DELETE FROM %@",tableName];
        [_db executeUpdate:sql];
    }
    else{
        NSString *sql=[NSString stringWithFormat:@"DELETE FROM %@ WHERE PID =%zi",tableName,ID];
        [_db executeUpdate:sql];
    }
    if ([_db hadError])
    {
        NSLog(@"DELETE FROM %@  ERROR  %d: %@",tableName, [_db lastErrorCode], [_db lastErrorMessage]);
    }
}

//===================查询=======================
#pragma mark -查询操作

-(NSArray *)SelectTableName:(NSString *)tableName  PID:(int)ID{
    
   
    NSMutableArray *temp=[NSMutableArray array];
    FMResultSet *rs=nil;
    if (ID==0) {
        
    NSString *sql=[NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY PID DESC",tableName];
    rs=[_db executeQuery:sql];
    }
    else{
      NSString *sql=[NSString stringWithFormat:@"SELECT * FROM %@ WHERE PID = %zi",tableName,ID];
     rs=[_db executeQuery:sql];
    }
    while ([rs next]){
//              GCB_Product *product= [GCB_Product ProductWithResultSet:rs];
//            [temp addObject:product];

    }
    return temp;
}


-(NSArray *)SelectTableName:(NSString *)tableName  startPage:(int)page{
    
    NSMutableArray *temp=[NSMutableArray array];
    NSString *sql=[NSString stringWithFormat:@"SELECT  * FROM %@ WHERE PID>=%zi AND PID<=%zi ORDER BY PID DESC",tableName,(page-1)*DB_PAGESIZE+1,page*DB_PAGESIZE];
    FMResultSet *rs=[_db executeQuery:sql];
   
    while ([rs next]){

        if ([tableName isEqualToString:@"OrderProduce"]) {
//            GCB_Product *product= [GCB_Product ProductWithResultSet:rs];
//            [temp addObject:product];
        }
    }
    return temp;
}





//===================插入=======================
#pragma mark -插入数据库操作

-(int)insertTablewithSql:(NSString *)sql{
//    NSLog(@"%@",sql);
    [_db executeUpdate:sql];
    if ([_db hadError])
    {
        NSLog(@"insertWith ERROR %d: %@", [_db lastErrorCode], [_db lastErrorMessage]);
        return (- 1);
    }
    return (int)[_db lastInsertRowId];
}
#pragma mark -拼接插入sql语句

-(NSString *)BuildInsertTableName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary {
    NSMutableString *appendStr=[NSMutableString string];
    NSMutableString *paramStr=[NSMutableString string];
    [appendStr appendFormat:@"INSERT INTO %@(",tablename];
    
    for (int i=0; i<keyArrary.count; i++) {
        NSString *value=valueArrary[i];
        if (i==keyArrary.count-1) {
            [appendStr appendFormat:@"%@)VALUES (",keyArrary[i]];
            [paramStr appendFormat:@"'%@')",value];
        }
        else{
            [appendStr appendFormat:@"%@,",keyArrary[i]];
            [paramStr appendFormat:@"'%@',",value];
        }
    }
    [appendStr appendString:paramStr];
    return appendStr;
    
}


//===================更新========================
#pragma mark -更新数据库操作
-(void)UpdateTableWithSql:(NSString *)sql{
    NSLog(@"%@",sql);
    [_db executeUpdate:sql];
    if ([_db hadError])
    {
        NSLog(@"UpdateWith ERROR %d: %@", [_db lastErrorCode], [_db lastErrorMessage]);
        
    }
    else{
        NSLog(@"更新成功");
    }
}

#pragma mark -拼接更新sql语句
-(NSString *)BuildUpdateName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary  PID:(int)ID{
    NSMutableString *appendStr=[NSMutableString string];
    [appendStr appendFormat:@"UPDATE %@ SET ",tablename];
    for (int i=0; i<keyArrary.count; i++) {
        NSString *value=valueArrary[i];
        if (i==keyArrary.count-1)
            [appendStr appendFormat:@"%@='%@'",keyArrary[i],value];
        else
            [appendStr appendFormat:@"%@='%@',",keyArrary[i],value];
    }
    [appendStr appendFormat:@"  where PID=%zi",ID];
    return appendStr;
    
}



@end
