//
//  ZYTabBar_C.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYTabBar_C.h"

@interface ZYTabBar_C ()

@end

@implementation ZYTabBar_C

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self config];
}

-(void)config
{
    ZYMain_VC *fleetingTimevc = [ZYMain_VC new];
    [fleetingTimevc setTitle:@"PrettyTime"];
    ZYHeartJourney_VC *hjvc = [ZYHeartJourney_VC new];
    [hjvc setTitle:@"Journey"];
    ZYChattingRecords_VC *crvc = [ZYChattingRecords_VC new];
    [crvc setTitle:@"Confidentials"];
    ZYAnniversary_VC *avc = [ZYAnniversary_VC new];
    [avc setTitle:@"Anniversary"];
    ZYDreamDirection_VC *ddvc = [ZYDreamDirection_VC new];
    [ddvc setTitle:@"Dream"];
    
    UINavigationController *ftnc = [[UINavigationController alloc] initWithRootViewController:fleetingTimevc];
    UINavigationController *hjnc = [[UINavigationController alloc] initWithRootViewController:hjvc];
    UINavigationController *crnc = [[UINavigationController alloc] initWithRootViewController:crvc];
    UINavigationController *anc = [[UINavigationController alloc] initWithRootViewController:avc];
    UINavigationController *ddnc = [[UINavigationController alloc] initWithRootViewController:ddvc];

    [ftnc setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Pretty Time" image:[[UIImage imageNamed:@"ft_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ft_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [hjnc setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Journey" image:[[UIImage imageNamed:@"journey_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"journey_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [crnc setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Secret" image:[[UIImage imageNamed:@"confident_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"confident_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [anc setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Anniversary" image:[[UIImage imageNamed:@"anniversary_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"anniversary_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [ddnc setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Dream" image:[[UIImage imageNamed:@"dream_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"dream_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    
    [self setViewControllers:@[ftnc,hjnc,crnc,ddnc,anc]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrangeColor,NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:12.0f]} forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
