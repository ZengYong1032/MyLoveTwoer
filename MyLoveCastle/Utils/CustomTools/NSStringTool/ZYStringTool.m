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

@end
