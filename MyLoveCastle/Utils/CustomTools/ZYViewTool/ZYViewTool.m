//
//  ZYViewTool.m
//  MyLocation
//
//  Created by ZyZl on 2017/8/26.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYViewTool.h"

@implementation ZYViewTool

+(BOOL)isHavingControl:(Class)controlclass target:(UIView *)view
{
    for (UIView *theview in view.subviews)
    {
        if ([theview class] == controlclass || [theview superclass] == controlclass)
        {
            return YES;
        }
    }
    return NO;
}

@end
