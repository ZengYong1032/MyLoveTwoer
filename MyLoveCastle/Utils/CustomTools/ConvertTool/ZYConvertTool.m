//
//  ZYConvertTool.m
//  MyNote
//
//  Created by ZyZl on 2017/8/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYConvertTool.h"

@implementation ZYConvertTool

+(NSString *)dateConvertToString:(NSDate *)date format:(dateConvertType)format
{
    return [[self setupCustomDateFormatterWithFormat:format] stringFromDate:date];

}

+(NSDate *)stringContvertToDate:(NSString *)dateStr format:(dateConvertType)format
{
    return [[self setupCustomDateFormatterWithFormat:format] dateFromString:dateStr];
}

+(NSString *)nowDateConvertToStringWithFormat:(dateConvertType)format
{
    return [[self setupCustomDateFormatterWithFormat:format] stringFromDate:[NSDate date]];
}

+(NSDate *)getNowDateWithFormat:(dateConvertType)format 
{
    return [[self setupCustomDateFormatterWithFormat:format]dateFromString:[self nowDateConvertToStringWithFormat:format]];
}

+(NSDateFormatter *)setupCustomDateFormatterWithFormat:(dateConvertType)format
{
    NSString *formatStr = @"";
    switch (format)
    {
        case 0:
            formatStr = @"yyyy-MM-dd HH:mm:ss zzz";
            break;
            
        case 1:
            formatStr = @"yyyy-MM-dd";
            break;
            
        case 2:
            formatStr = @"yyyy-MM-dd HH:mm:ss";
            break;
            
        case 3:
            formatStr = @"HH:mm:ss";
            break;
            
        case 4:
            formatStr = @"HH:mm";
            break;
            
        default:
            formatStr = @"yyyy-MM-dd HH:mm:ss";
            break;
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatStr];
    return dateFormat;
}

+(NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string controlType:(controlType)type
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (type == ZYTextView)
    {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 2.0;
        paragraphStyle.paragraphSpacing = 4.0;
        paragraphStyle.firstLineHeadIndent = 30.0;
        
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeString.length)];
        [attributeString addAttributes:@{NSFontAttributeName:SYSTEMFONT(16),NSKernAttributeName:@(2),NSUnderlineStyleAttributeName:@(NSUnderlinePatternDot | NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kCyanColor,NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(0, attributeString.length)];
    }
    else
    {
        [attributeString addAttributes:@{NSFontAttributeName:SYSTEMFONT(15),NSForegroundColorAttributeName:kGray2Color,NSLigatureAttributeName:@(1),NSTextEffectAttributeName:NSTextEffectLetterpressStyle} range:NSMakeRange(0, attributeString.length)];
    }
    
    return attributeString;
}

@end
