//
//  UIViewController+ZYBasicSetting.m
//  MyNote
//
//  Created by ZyZl on 2017/8/9.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "UIViewController+ZYBasicSetting.h"

@implementation UIViewController (ZYBasicSetting)

-(void)backToSuperNavigationC
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backToSuperVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
