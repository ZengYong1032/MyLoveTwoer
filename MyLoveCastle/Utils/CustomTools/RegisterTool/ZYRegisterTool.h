//
//  ZYRegisterTool.h
//  MyNote
//
//  Created by ZyZl on 2017/8/11.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYRegisterTool : NSObject

+(void)registerTargetNotificationWithTarget:(nullable UIViewController *)target selector:(nullable SEL)aSelector notificationName:(nullable NSNotificationName)name object:(nullable id)anObject;
+(void)removeNotiicationWithAbserver:(nullable id)target notifications:(nullable NSArray *)notifsArray;
+(void)registerTargetNotificationWithTarget:(nullable UIViewController *)target selsArray:(nullable NSArray *)aSelArray notificationNamesArray:(nullable NSArray *)name object:(nullable id)anObject;

@end
