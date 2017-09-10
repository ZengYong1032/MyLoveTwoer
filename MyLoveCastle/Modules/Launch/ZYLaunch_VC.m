//
//  ZYLaunch_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYLaunch_VC.h"

@interface ZYLaunch_VC ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *launchImageView;
@property (nonatomic,strong) UIPageControl *launchPageControl;
@property (nonatomic,strong) UIButton *skipButton;

@end

@implementation ZYLaunch_VC

-(UIButton *)skipButton
{
    if (!_skipButton)
    {
        _skipButton = [ZYCustomControls createButtonWithFrame:CGRectMake(kScreen_X(0.5) - 60.0, kScreenHeight - 90.0, 120.0, 30.0) type:UIButtonTypeCustom title:@"Start" textFont:16 titleColor:kOrangeColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kClearColor bgImage:nil highImage:nil tag:0];
        _skipButton.userInteractionEnabled = YES;
        [_skipButton addTarget:self action:@selector(skipToTabVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}

-(UIScrollView *)launchImageView
{
    if (!_launchImageView)
    {
        _launchImageView = [[UIScrollView alloc] initWithFrame:kScreen_Bounds];
        _launchImageView.delegate = self;
        _launchImageView.contentSize = CGSizeMake(kScreenWidth * 4, 0);
        _launchImageView.bounces = YES;
        _launchImageView.alwaysBounceHorizontal = YES;
        _launchImageView.pagingEnabled = YES;
        _launchImageView.showsVerticalScrollIndicator = NO;
        _launchImageView.showsHorizontalScrollIndicator = NO;
        _launchImageView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
//        [_launchImageView setBackgroundColor:kBlackColor];
        
        NSString *launchImgStr = nil;
        
        for (int i = 0; i<4; i++)
        {
            UIImageView *launchImg = [[UIImageView alloc] initWithFrame:CGRectMake( i * kScreenWidth,0, kScreenWidth , kScreenHeight)];
            
            if (i == 5)
            {
                launchImgStr = @"launch.png";
            }
            else
            {
                launchImgStr = NSStringFormat(@"launch_%d.png",i);
                
                if (i == 3)
                {
                    launchImg.userInteractionEnabled = YES;
                    [launchImg addSubview:self.skipButton];
                }
            }
            
            [launchImg setImage:[UIImage imageNamed:launchImgStr]];
            [_launchImageView addSubview:launchImg];
        }
    }
    return _launchImageView;
}

-(UIPageControl *)launchPageControl
{
    if (!_launchPageControl)
    {
        _launchPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, kScreenHeight - 40.0, kScreen_X(1), 30.0)];
        [_launchPageControl setCurrentPageIndicatorTintColor:kOrangeColor];
        [_launchPageControl setPageIndicatorTintColor:kCyanColor];
        [_launchPageControl setNumberOfPages:4];
        [_launchPageControl setCurrentPage:0];
    }
    return _launchPageControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    [self.view addSubview:self.launchImageView];
    [self.view addSubview:self.launchPageControl];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    
    NSInteger index = round(point.x / kScreenWidth);
    
    self.launchPageControl.currentPage = index ;
    
}

-(void)skipToTabVC
{
    [kAppDelegate.window setRootViewController:[ZYTabBar_C new]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
