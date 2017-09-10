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

+(NSMutableAttributedString *)sharedTitleAttributedString:(NSString *)string
{
    //,NSObliquenessAttributeName:@(1)
    NSMutableAttributedString *mats = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:15],NSForegroundColorAttributeName :kBlackColor,NSKernAttributeName:@(0),NSStrokeWidthAttributeName:@(-2),NSStrokeColorAttributeName:kCustomColor(96, 244, 223, 1.0)}];
    
    return mats;
}

+(NSMutableAttributedString *)sharedDecriptionAttributedString:(NSString *)string
{
    return [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:SYSTEMFONT(16),NSForegroundColorAttributeName:kCyanColor}];
}

+(NSString *)getDateDifferenceWithDateString:(NSString *)datestring
{
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDate];
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy"];
    
    return NSStringFormat(@"%ld",([[formatter stringFromDate:nowDate] integerValue] - [[formatter stringFromDate:theDate] integerValue] + 1));
}

+(NSMutableDictionary *)getDayDifferenceWithDateString:(NSString *)datestring
{
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    NSDate *theDate = [self stringContvertToDate:datestring format:ZYDate];
    NSDate *nowDate = [self getNowDateWithFormat:ZYDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy"];
    NSString *nyy = [formatter stringFromDate:nowDate];
    [formatter setDateFormat:@"MM"];
    NSString *mm = [formatter stringFromDate:theDate];
    [formatter setDateFormat:@"dd"];
    NSString *dd = [formatter stringFromDate:theDate];
    
    NSDate *nowtheDate;
    
    nowtheDate = [self stringContvertToDate:NSStringFormat(@"%@-%@-%@",nyy,mm,dd) format:ZYDate];
    
    if ([nowtheDate timeIntervalSinceDate:nowDate] < 0)
    {
        [results setObject:@"YES" forKey:@"isPassing"];
        nowtheDate = [self stringContvertToDate:NSStringFormat(@"%ld-%@-%@",([nyy integerValue] +1),mm,dd) format:ZYDate];
        
    }
    else
    {
        [results setObject:@"NO" forKey:@"isPassing"];
    }
    
    [results setObject:NSStringFormat(@"%.f",([nowtheDate timeIntervalSinceDate:nowDate] / (24 * 60 * 60))) forKey:@"Interval"];
    
    return results;
}

+(NSMutableAttributedString *)stringConvertToAttributeString:(NSString *)string fontSize:(NSInteger)fontsize kernSzie:(NSInteger)ksize tcolor:(UIColor *)tcolor firstHeadIndent:(NSInteger)indent isHaveunderLine:(BOOL)isHaving isZapFont:(BOOL)isZap
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    if (indent > 0)
    {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 1.0;
        paragraphStyle.paragraphSpacing = 1.0;
        paragraphStyle.firstLineHeadIndent = indent;
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeString.length)];
    }

    [attributeString addAttributes:isHaving ? @{NSFontAttributeName:(isZap ? [UIFont fontWithName:@"Zapfino" size:fontsize] : SYSTEMFONT(fontsize)),NSKernAttributeName:@(ksize),NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kGray2Color,NSForegroundColorAttributeName:tcolor} : @{NSFontAttributeName:(isZap ? [UIFont fontWithName:@"Zapfino" size:fontsize] : SYSTEMFONT(fontsize)),NSKernAttributeName:@(ksize),NSForegroundColorAttributeName:tcolor} range:NSMakeRange(0, attributeString.length)];
    return attributeString;
}

@end
