//
//  ZYDataFilter.h
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/19.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDataFilter : NSObject

+(NSString *)stringFilter:(id)stringdate;
+(NSArray *)arrayFilter:(id)arraydata;
+(NSDictionary *)dictionaryFilter:(id)dictionarydata;
+(NSNumber *)numberFilter:(id)numberdata;

@end
