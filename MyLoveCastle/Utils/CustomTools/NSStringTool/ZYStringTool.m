//
//  ZYStringTool.m
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYStringTool.h"

@implementation ZYStringTool

+(NSString *)removeSpaceFromString:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+(NSString *)removeWhitespaceAndNewlineCharacterSetFromString:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+(CGFloat)computeAttributedStringSizeWithString:(NSAttributedString *)string tvWidth:(CGFloat)width
{
    NSRange range = NSMakeRange(0, string.length);
    // 获取该段attributedString的属性字典
    NSDictionary *dic = [string attributesAtIndex:0 effectiveRange:&range];
    // 计算文本的大小
    CGSize sizeToFit = [string.string boundingRectWithSize:CGSizeMake(width - 16.0, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
     // 用于计算文本绘制时占据的矩形块
     // 文本绘制时的附加选项
     // 文字的属性
    
    return sizeToFit.height + 16.0;
}

@end
