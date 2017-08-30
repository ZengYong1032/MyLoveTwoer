//
//  ZYDataFilter.m
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/19.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYDataFilter.h"

@implementation ZYDataFilter

+(NSString *)stringFilter:(id)stringdate
{
    if (!stringdate || ![stringdate isKindOfClass:[NSString class]])
    {
        return @"";
    }
    
    return stringdate;
}

+(NSArray *)arrayFilter:(id)arraydata
{
    if (!arraydata || ![arraydata isKindOfClass:[NSArray class]])
    {
        return @[];
    }
    
    return arraydata;
}

+(NSDictionary *)dictionaryFilter:(id)dictionarydata
{
    if (!dictionarydata || ![dictionarydata isKindOfClass:[NSDictionary class]])
    {
        return @{};
    }
    
    return dictionarydata;
}

+(NSNumber *)numberFilter:(id)numberdata
{
    if (!numberdata || ![numberdata isKindOfClass:[NSNumber class]])
    {
        return @(0);
    }
    
    return numberdata;
}

@end
