//
//  ZYConvertTool.h
//  MyNote
//
//  Created by ZyZl on 2017/8/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,dateConvertType)
{
    ZYDefault = 0,
    ZYDate = 1,
    ZYDateAndTime = 2,
    ZYTimeDefault = 3,
    ZYTimeHourAndS = 4
};

typedef NS_ENUM(NSInteger,controlType)
{
    ZYTextField = 0,
    ZYTextView = 1
};

@interface ZYConvertTool : NSObject

+(NSString *)dateConvertToString:(NSDate *)date format:(dateConvertType)format;
+(NSString *)nowDateConvertToStringWithFormat:(dateConvertType)format;
+(NSDate *)getNowDateWithFormat:(dateConvertType)format;
+(NSDate *)stringContvertToDate:(NSString *)dateStr format:(dateConvertType)format;
+(NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string controlType:(controlType)type;
+(NSDateFormatter *)setupCustomDateFormatterWithFormat:(dateConvertType)format;

@end
