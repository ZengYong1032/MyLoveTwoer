//
//  ZYPersonalView_Model.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPersonalView_Model.h"

@interface ZYPersonalView_Model ()

@property (nonatomic,strong) UILabel *nickLab;
@property (nonatomic,strong) UILabel *dateLab;
@property (nonatomic,strong) UIImageView *headImgView;

@end

@implementation ZYPersonalView_Model

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setFrame:frame];
    }
    return self;
}

+(ZYPersonalView_Model *)createPersonalInfoViewWithpersonalInnfoModel:(ZYLogInfo_Model *)logInfo frame:(CGRect)frame
{
    ZYPersonalView_Model *piv = [[self alloc] initWithFrame:frame];
    
    piv.logPersonalInfo = logInfo;
    
    piv.nickLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 6.0, kSmallSpace * 2.0, kScreenWidth - kNormSpace * 7.0, 26.0) text:logInfo.nickStr textFont:15 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentLeft tag:0];
    piv.dateLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 6.0, kSmallSpace  + 26.0, kScreenWidth - kNormSpace * 7.0, 26.0) text:logInfo.dateStr textFont:14 textColor:kGray2Color borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentLeft tag:0];
    piv.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kNormSpace, kNormSpace, 40.0, 40.0)];
    [piv.headImgView setImage:[UIImage imageNamed:logInfo.headImgName]];
    [piv.headImgView setContentMode:UIViewContentModeScaleToFill];
    
    [piv addSubview:piv.nickLab];
    [piv addSubview:piv.dateLab];
    [piv addSubview:piv.headImgView];
    return piv;
}

@end
