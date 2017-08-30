//
//  AppDelegate_ZYService.h
//  ControlsTest
//
//  Created by ZyZl on 2017/7/3.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM(BOOL,testType)
{
    ZYVCTEST = YES,
    ZYBAVIGAtION = NO
};

@interface AppDelegate ()

@property (nonatomic,assign) testType vcOrNavigation;

@end
