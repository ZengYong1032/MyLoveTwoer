//
//  ZYCustomIndicatorView.m
//  ControlsTest
//
//  Created by ZyZl on 2017/7/4.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYCustomIndicatorView.h"

@implementation ZYCustomIndicatorView

+(ZYCustomIndicatorView *)createIndicatorViewWithMarkString:(NSString *)markString
{
    ZYCustomIndicatorView *indicator = [[ZYCustomIndicatorView alloc] initWithFrame:CGRectMake(kScreenWidth * 0.5 - 50.0, kScreenHeight * 0.5 - 100.0, 100.0, 100.0)];
    indicator.layer.cornerRadius = 10.0;
    indicator.layer.borderWidth = 0.5;
    indicator.layer.borderColor = kCustomGrayColor(0.85, 1.0).CGColor;
    [indicator setBackgroundColor:kCustomGrayColor(0.7, 1.0)];
    
    UILabel *markLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70.0, 100.0, 30.0)];
    [markLabel setBackgroundColor:kClearColor];
    [markLabel setText:markString];
    [markLabel setFont:SYSTEMFONT(12)];
    [markLabel setTextColor:kCustomGrayColor(0.9, 1.0)];
    [markLabel setTextAlignment:NSTextAlignmentCenter];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(20.0, 15.0, 60.0, 60.0)];
    [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicatorView.hidesWhenStopped = YES;
    [indicatorView startAnimating];
    
    [indicator addSubview:markLabel];
    [indicator addSubview:indicatorView];
    
    return indicator;
}


@end
