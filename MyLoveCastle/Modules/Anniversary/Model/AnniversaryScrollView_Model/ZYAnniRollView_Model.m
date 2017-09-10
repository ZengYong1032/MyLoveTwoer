//
//  ZYAnniRollView_Model.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYAnniRollView_Model.h"

@implementation ZYAnniRollView_Model

+(ZYAnniRollView_Model *)createAnniRollViewWithAnniversaryModel:(ZYAnniversary_Model *)annimodel frame:(CGRect)frame
{
    ZYAnniRollView_Model *arv = [[ZYAnniRollView_Model alloc] initWithFrame:frame];
    arv.layer.cornerRadius = 5.0;
    arv.layer.borderWidth = 0.5;
    arv.layer.borderColor = kCyanColor.CGColor;
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [bg setImage:[UIImage imageNamed:annimodel.bgImgName]];
    
    UILabel *sloganLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace * 2.0, kSmallSpace, frame.size.width - kNormSpace * 4.0, 30.0) text:@"" textFont:15 textColor:kOrangeColor borderWidth:0.5 borderColor:kClearColor cornerRadius:5.0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    [sloganLab setAttributedText:[ZYConvertTool stringConvertToAttributeString:annimodel.slogan fontSize:16 kernSzie:1 tcolor:kOrangeColor firstHeadIndent:0 isHaveunderLine:YES isZapFont:NO]];
    
    UILabel *timeTitle = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace , 40.0 , 100.0, 30.0) text:@"Name:" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    UILabel *dateLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace + 100.0 , 40.0 , 180.0, 30.0) text:annimodel.anniName textFont:20 textColor:kBlueColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    UILabel *annualTitle = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace , 76.0 , 100.0, 30.0) text:@"Anniversaries:" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    UILabel *annLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace + 100.0 , 76.0 , 180.0, 30.0) text:annimodel.annCount textFont:20 textColor:kBlueColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    UILabel *planTitle = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace , 112.0 , 100.0, 30.0) text:@"Date:" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    UILabel *planLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace + 100.0 , 112.0 , 180.0, 30.0) text:annimodel.dateStr textFont:20 textColor:kBlueColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    
    NSArray *subViews = @[bg,sloganLab,timeTitle,dateLab,annualTitle,annLab,planTitle,planLab];
    
    for (int i=0; i<subViews.count; i++)
    {
        [arv addSubview:subViews[i]];
    }
    
    return arv;
}

@end
