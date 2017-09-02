//
//  ZYStringTool.h
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYStringTool : NSObject

//Delete the blank space from string
+(NSString *)removeSpaceFromString:(NSString *)string;
+(NSString *)removeWhitespaceAndNewlineCharacterSetFromString:(NSString *)string;
+(CGFloat)computeAttributedStringSizeWithString:(NSMutableAttributedString *)string tvWidth:(CGFloat)width;

@end
