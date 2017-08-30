//
//  ZYDataPersistenceTool.h
//  MyNote
//
//  Created by ZyZl on 2017/8/10.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDataPersistenceTool : NSObject

 //Determine if there is the file in the target ditectory.
//+(BOOL)createEditableCopyDatabaseIfNeedWithFilePath:(NSString *)filePath fileName:(NSString *)name;
//+(void)createEditableCopyDatabaseIfNeededWithFilePath:(NSString *)filePath key:(NSString *)key;
+(void)createEditableCopyDatabaseIfNeedWithSQLiteFilePath:(NSString *)filePath sqlite:(sqlite3 *)db;
+(NSBundle *)getTargetBundleWithTargetClass:(Class)target;
+(NSString *)getTargetBundlePathWithTargetClass:(Class)target;

+(BOOL)archiveDataWithTargetArray:(NSMutableArray *)array path:(NSString *)path key:(NSString *)key;
+(BOOL)archiveDataWithTargetDictionary:(NSMutableDictionary *)dict path:(NSString *)path key:(NSString *)key;
+(NSMutableDictionary *)unArchiveDictionaryDataWithPath:(NSString *)path key:(NSString *)key;
+(NSMutableArray *)unArchiveDataWithPath:(NSString *)path key:(NSString *)key;


@end
