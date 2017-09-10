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
+(NSString *)getDateDifferenceWithDateString:(NSString *)datestring;
+(NSMutableDictionary *)getDayDifferenceWithDateString:(NSString *)datestring;
+(NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string controlType:(controlType)type;
+(NSMutableAttributedString *)sharedTitleAttributedString:(NSString *)string;
+(NSMutableAttributedString *)sharedDecriptionAttributedString:(NSString *)string;
+(NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string fontSize:(NSInteger)fontsize kernSzie:(NSInteger)ksize tcolor:(UIColor *)tcolor firstHeadIndent:(NSInteger)indent isHaveunderLine:(BOOL)isHaving  isZapFont:(BOOL)isZap;
+(NSDateFormatter *)setupCustomDateFormatterWithFormat:(dateConvertType)format;

@end
