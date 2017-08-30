//
//  ZYDataPersistenceTool.m
//  MyNote
//
//  Created by ZyZl on 2017/8/10.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYDataPersistenceTool.h"

@implementation ZYDataPersistenceTool

+(void)createEditableCopyDatabaseIfNeedWithSQLiteFilePath:(NSString *)filePath sqlite:(sqlite3 *)db
{
    const char *cpath = [filePath UTF8String];
    
    if (sqlite3_open(cpath, &db) != SQLITE_OK)
    {
        NSLog(@"-----------数据库打开失败----------");
    }
    else
    {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Note (cdate TEXT PRIMARY KEY,cContent TEXT,cTitle TEXT);"];
        const char *cSql = [sql UTF8String];
        
        if (sqlite3_exec(db, cSql, NULL, NULL, NULL) != SQLITE_OK)
        {
            NSLog(@"-------------创建表失败------------");
        }
    }
    sqlite3_close(db);
}

/*
+(BOOL)createEditableCopyDatabaseIfNeedWithFilePath:(NSString *)filePath fileName:(NSString *)name
{
    if (![kFileManager fileExistsAtPath:filePath])
    {
        NSBundle *frameworkBundle = [NSBundle bundleForClass:[ZYNoteService class]];
        NSString *frameworkBundlePath = [frameworkBundle resourcePath];
        NSString *defaultDBPath = [frameworkBundlePath stringByAppendingPathComponent:name];
        NSError *error;
        
        NSAssert([kFileManager copyItemAtPath:defaultDBPath toPath:filePath error:&error], @"File write failed.");
        return NO;
    }
    return YES;
}
*/

+(NSBundle *)getTargetBundleWithTargetClass:(Class)target
{
    return [NSBundle bundleForClass:target];
}

+(NSString *)getTargetBundlePathWithTargetClass:(Class)target
{
    return [[self getTargetBundleWithTargetClass:target] resourcePath];
}

/*
+(void)createEditableCopyDatabaseIfNeededWithFilePath:(NSString *)filePath key:(NSString *)key
{
    if (![kFileManager fileExistsAtPath:filePath])
    {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSDate *date0 = [dateFormatter dateFromString:@"2017-01-01 15:17:48"];
        ZYNote *note2 = [[ZYNote alloc] initWithDate:date0 title:@"Welcome to MyNote" content:@"MyNote is my first note application."];
        NSDate *date1 = [dateFormatter dateFromString:@"2017-08-08 15:17:48"];
        ZYNote *note3 = [[ZYNote alloc] initWithDate:date1 title:@"Thanks for using MyNote" content:@"Thank you for using our application,we are sincerely in your service!"];
        
        NSMutableArray *notes = [NSMutableArray arrayWithObjects:note2,note3, nil];
        
        NSMutableData *notedata = [NSMutableData data];
        NSKeyedArchiver *arch = [[NSKeyedArchiver alloc] initForWritingWithMutableData:notedata];
        [arch encodeObject:notes forKey:key];
        [arch finishEncoding];
        
        [notedata writeToFile:filePath atomically:YES];
    }
}
*/

+(BOOL)archiveDataWithTargetArray:(NSMutableArray *)array path:(NSString *)path key:(NSString *)key
{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [arch encodeObject:array forKey:key];
    [arch finishEncoding];
    
    return [data writeToFile:path atomically:YES];
}

+(BOOL)archiveDataWithTargetDictionary:(NSMutableDictionary *)dict path:(NSString *)path key:(NSString *)key
{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [arch encodeObject:dict forKey:key];
    [arch finishEncoding];
    
    return [data writeToFile:path atomically:YES];
}

+(NSMutableDictionary *)unArchiveDictionaryDataWithPath:(NSString *)path key:(NSString *)key
{
    NSData *notesData = [NSData dataWithContentsOfFile:path];
    
    if ([notesData length] > 0)
    {
        NSKeyedUnarchiver *unarch = [[NSKeyedUnarchiver alloc] initForReadingWithData:notesData];
        NSMutableDictionary *notesDict = [unarch decodeObjectForKey:key];
        [unarch finishDecoding];
        
        return notesDict;
    }
    return nil;
}

+(NSMutableArray *)unArchiveDataWithPath:(NSString *)path key:(NSString *)key
{
    NSData *notesData = [NSData dataWithContentsOfFile:path];
    
    if ([notesData length] > 0)
    {
        NSKeyedUnarchiver *unarch = [[NSKeyedUnarchiver alloc] initForReadingWithData:notesData];
        NSMutableArray *notesArray = [unarch decodeObjectForKey:key];
        [unarch finishDecoding];
        
        return notesArray;
    }
    return nil;
}

@end
