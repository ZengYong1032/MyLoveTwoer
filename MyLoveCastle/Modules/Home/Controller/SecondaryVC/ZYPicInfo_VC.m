//
//  ZYPicInfo_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPicInfo_VC.h"
#define kNameWidth  50.0
#define kNameHeight 30.0

@interface ZYPicInfo_VC ()<UITextViewDelegate>

@property (nonatomic,strong) UIImageView *picView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *dateLab;
@property (nonatomic,strong) UILabel *addressLab;
@property (nonatomic,strong) UITextView *descriptionTV;

@end

@implementation ZYPicInfo_VC

-(UIImageView *)picView
{
    if (!_picView)
    {
        _picView = [[UIImageView alloc] initWithFrame:CGRectMake(kNormSpace, kNormSpace * 6.7, kScreenWidth - kNormSpace * 2, kScreen_Y(0.5))];
        [_picView setImage:[UIImage imageNamed:self.picInfo.picName]];
        _picView.userInteractionEnabled = NO;
    }
    return _picView;
}

-(UILabel *)titleLab
{
    if (!_titleLab)
    {
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kScreen_Y(0.5) + kNormSpace * 7.3, kNameWidth, kNameHeight) text:@"Title:" textFont:15 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        _titleLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 2.0 + kNameWidth, kScreen_Y(0.5) + kNormSpace * 7.3, kNameWidth *1.5, kNameHeight) text:self.picInfo.picTitle textFont:15 textColor:kGray2Color borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        [self.view addSubview:nameLab];
    }
    return _titleLab;
}

-(UILabel *)dateLab

{
    if (!_dateLab)
    {
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace+ kScreen_X(0.5), kScreen_Y(0.5) + kNormSpace * 7.3, kNameWidth, kNameHeight) text:@"Date:" textFont:15 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        _dateLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 2 + kScreen_X(0.5) + kNameWidth, kScreen_Y(0.5) + kNormSpace * 7.3, kNameWidth *2.0, kNameHeight) text:self.picInfo.picDate textFont:15 textColor:kGray2Color borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        [self.view addSubview:nameLab];
    }
    return _dateLab;
}

-(UILabel *)addressLab
{
    if (!_addressLab)
    {
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kScreen_Y(0.5) + kNormSpace * 8.3 + kNameHeight, kNameWidth * 1.5, kNameHeight) text:@"Address:" textFont:15 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        _addressLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 2 + kNameWidth * 1.5, kScreen_Y(0.5) + kNormSpace * 8.3 + kNameHeight, kNameWidth *3.0, kNameHeight) text:self.picInfo.picAddress textFont:15 textColor:kGray2Color borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
        [self.view addSubview:nameLab];
    }
    return _addressLab;
}

-(UITextView *)descriptionTV
{
    if (!_descriptionTV)
    {
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kScreen_Y(0.5) + kNormSpace * 9.3 + kNameHeight * 2.0, kNameWidth * 2.5, kNameHeight) text:@"Description:" textFont:16 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentLeft tag:0];
        
        
        NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:self.picInfo.picDescription attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kGrayColor,NSKernAttributeName:@(0.5)}];
        NSMutableParagraphStyle *paragraph =  [NSMutableParagraphStyle new];
        paragraph.firstLineHeadIndent = 30;
        
        [astr  addAttribute:NSParagraphStyleAttributeName  value:paragraph range:NSMakeRange(0,self.picInfo.picDescription.length)];

        _descriptionTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, kScreen_Y(0.5) + kNormSpace * 9.3 + kNameHeight * 3.0, kScreenWidth, 60.0) vc:self attributedString:astr editable:NO selectable:NO];
//        _descriptionTV.scrollEnabled = NO;
        [self.view addSubview:nameLab];
    }
    return _descriptionTV;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    self.title = self.picInfo.picTitle;
    
    [self.view addSubview:self.picView];
    [self.view addSubview:self.titleLab];
    [self.view addSubview:self.dateLab];
    [self.view addSubview:self.addressLab];
    [self.view addSubview:self.descriptionTV];
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
