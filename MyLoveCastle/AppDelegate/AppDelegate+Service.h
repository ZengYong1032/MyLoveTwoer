//
//  AppDelegate+Service.h
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/9.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM(NSInteger,ZYLogDataType)
{
    ZYLogDataTypeOld = 0,
    ZYLogDataTypeNew ,
    ZYLogDataTypeAll
};

@interface AppDelegate (Service)

-(void)setUmSocialAppkeyWithKey:(NSString *)key;
-(NSMutableArray *)addLogsDataWithDataType:(ZYLogDataType)datatype;
-(NSMutableArray *)setupAnniversaryDataArray;

@end
