//
//  ZYWriteAndEditLogs_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYWriteAndEditLogs_VC.h"

@interface ZYWriteAndEditLogs_VC ()<UITextFieldDelegate,UITextViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UITextField *titleTF;
@property (nonatomic,strong) UITextView *contentTV;
@property (nonatomic,strong) UIButton *holdButton;
@property (nonatomic,strong) UIScrollView *baseView;

@end

@implementation ZYWriteAndEditLogs_VC

-(UIScrollView *)baseView
{
    if (!_baseView)
    {
        _baseView = [[UIScrollView alloc] initWithFrame:kScreen_Bounds];
        [_baseView setContentSize:CGSizeMake(kScreenWidth, self.contentTV.frame.size.height + self.contentTV.frame.origin.y - 46.0)];
        _baseView.delegate = self;
        _baseView.showsVerticalScrollIndicator = YES;
        _baseView.showsHorizontalScrollIndicator = NO;
        _baseView.scrollEnabled = YES;
        _baseView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _baseView;
}

-(UITextField *)titleTF
{
    if (!_titleTF)
    {
        _titleTF = [ZYCustomControls createTextFieldWithTarget:self frame:CGRectMake(kNormSpace * 3, kNormSpace * 2.0, kScreenWidth - kNormSpace * 6.0, 30.0) placeholder:@"please enter a title for your new log." keyboardType:UIKeyboardTypeDefault returntype:UIReturnKeyDone tag:0 hasborder:YES];
        [_titleTF setTextAlignment:NSTextAlignmentCenter];
        _titleTF.layer.cornerRadius = kNormSpace;
    }
    return _titleTF;
}

-(UITextView *)contentTV
{
    if (!_contentTV)
    {
        _contentTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(kNormSpace * 0.5, kNormSpace * 6.0, kScreenWidth - kNormSpace * 1.0,(self.handleType == ZYHandleTypeWrite ?  (kScreenHeight - kNormSpace * 6.0):[ZYStringTool computeAttributedStringSizeWithString:self.sourceLogInfo.contents tvWidth:kScreenWidth]) - 64.0) vc:self attributedString:(self.handleType == ZYHandleTypeWrite ? [[NSAttributedString alloc] initWithString:@""] : self.sourceLogInfo.contents) editable:YES selectable:YES];
        [_contentTV setFont:SYSTEMFONT(16)];
        _contentTV.layer.cornerRadius = 5.0;
    }
    return _contentTV;
}

-(UIButton *)holdButton
{
    if (!_holdButton)
    {
        _holdButton = [ZYCustomControls createButtonWithFrame:CGRectMake(0, 0, 50.0, 30.0) type:UIButtonTypeCustom title:@"hold" textFont:15 titleColor:kWhiteColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kOrangeColor bgImage:nil highImage:nil tag:0];
        [_holdButton addTarget:self action:@selector(holdLog) forControlEvents:UIControlEventTouchUpInside];
    }
    return _holdButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    self.title = @"Write new Log";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.holdButton];
    
    [self.baseView addSubview:self.titleTF];
    [self.baseView addSubview:self.contentTV];
    
    [self.view addSubview:self.baseView];
}

-(void)holdLog
{
    NSString *logTitleStr = self.titleTF.text;
    NSAttributedString *content = self.contentTV.attributedText;
    
    if (self.handleType == ZYHandleTypeWrite)
    {
        ZYLogInfo_Model *info = [ZYLogInfo_Model new];
        info.logTitle = logTitleStr;
        info.contents = content;
        info.dateStr = [ZYConvertTool nowDateConvertToStringWithFormat:ZYDate];
        info.nickStr = @"落叶不喜秋";
        info.headImgName = @"o2.png";
        info.modifyDateStr = @"0000-00-00";
        info.typeTag = @"6";
        info.categoryId = [kAppDelegate.newsLogArray count];
        info.logId = [kAppDelegate.logsArray count];
        
        [kAppDelegate.newsLogArray addObject:info];
        [kAppDelegate.logsArray addObject:info];
    }
    else
    {
        self.sourceLogInfo.logTitle = logTitleStr;
        self.sourceLogInfo.contents = content;
        self.sourceLogInfo.modifyDateStr = [ZYConvertTool nowDateConvertToStringWithFormat:ZYDate];
        
        [kAppDelegate.logsArray replaceObjectAtIndex:self.sourceLogInfo.logId withObject:self.sourceLogInfo];
        if ([self.sourceLogInfo.typeTag isEqualToString:@"0"])
        {
            [kAppDelegate.oldLogArray replaceObjectAtIndex:self.sourceLogInfo.categoryId withObject:self.sourceLogInfo];
        }
        else
        {
            [kAppDelegate.newsLogArray replaceObjectAtIndex:self.sourceLogInfo.categoryId withObject:self.sourceLogInfo];
        }
        
    }
    
    self.titleTF.text = nil;
    self.contentTV.text = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ---- UIText Field Delegate Method ----
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.contentTV becomeFirstResponder];
    
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
