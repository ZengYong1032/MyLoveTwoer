//
//  ZYRegisterTool.m
//  MyNote
//
//  Created by ZyZl on 2017/8/11.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYRegisterTool.h"

@implementation ZYRegisterTool

+(void)registerTargetNotificationWithTarget:(UIViewController *)target selector:(SEL)aSelector notificationName:(NSNotificationName)name object:(id)anObject
{
    [kNotificationCenter addObserver:target selector:aSelector name:name object:anObject];
}

+(void)registerTargetNotificationWithTarget:(UIViewController *)target selsArray:(NSArray *)aSelArray notificationNamesArray:(NSArray *)name object:(id)anObject
{
    for (int i = 0; i < [aSelArray count]; i++)
    {
        [kNotificationCenter addObserver:target selector:kConvertSelWithString(aSelArray[i]) name:(NSNotificationName)name[i] object:nil];
    }
}

+(void)removeNotiicationWithAbserver:(id)target notifications:(NSArray *)notifsArray
{
    for (NSNotificationName notiName in notifsArray)
    {
        [kNotificationCenter removeObserver:target name:notiName object:nil];
    }
}

@end
