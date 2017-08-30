//
//  ZYBase_VC.m
//  AddressBookApplication
//
//  Created by ZyZl on 2017/6/20.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYBase_VC.h"

@interface ZYBase_VC ()

@end

@implementation ZYBase_VC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)config
{
    if (CurrentSystemVersion > 7)
     {
         self.navigationController.navigationBar.barTintColor = kCustomColor(0.f,134.f,220.f,1.f);
         self.navigationController.navigationBar.translucent = NO;
         self.navigationController.navigationBar.tintColor = kWhiteColor;
    }
    else
    {
        self.navigationController.navigationBar.tintColor = kCustomColor(0.f, 134.f, 220.f, 1.f);
    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor}];
    
    // background color kCustomColor(.93f, .93f, .956f, 1.f)
    self.view.backgroundColor = kCustomGrayColor(0.9, 1.0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.titleString;
}
    
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.title = @"";
}

-(CGFloat)viewOffsetY
{
    if (self.navigationController.navigationBar.translucent)
     {
         CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
         return MIN(statusBarSize.width, statusBarSize.height) + self.navigationController.navigationBar.frame.size.height;
    }
    return 0.f;
}


@end
