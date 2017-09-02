//
//  ZYPretyTimeHeadView_Model.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPretyTimeHeadView_Model.h"

#define ImgWidth  60.0


@implementation ZYPretyTimeHeadView_Model

+(ZYPretyTimeHeadView_Model *)createPretyTimeHeadViewWithTarget:(UIViewController<UITextViewDelegate> *)vc frame:(CGRect)frame headshots:(NSArray *)headshots content:(NSString *)content
{
    ZYPretyTimeHeadView_Model *pthv = [[ZYPretyTimeHeadView_Model alloc] initWithFrame:frame];
//    [pthv setBackgroundColor:kBlackColor];
    
    UIImageView *boyImg = [[UIImageView alloc] initWithFrame:CGRectMake(kNormSpace, kStandardSpace, ImgWidth, ImgWidth)];
    [boyImg setImage:[[UIImage imageNamed:headshots[0]] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    UIImageView *girlImg = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - kNormSpace - ImgWidth, kStandardSpace, ImgWidth, ImgWidth)];
    [girlImg setImage:[UIImage imageNamed:headshots[1]]];
    
    UIImageView *decoretionPic = [[UIImageView alloc] initWithFrame:CGRectMake(kNormSpace * 4 + ImgWidth, kNormSpace + 15.0, kScreenWidth - kNormSpace * 8 - ImgWidth * 2, 30.0)];
    [decoretionPic setImage:[UIImage imageNamed:@"decoretionpic.png"]];
    
    UILabel *boyId = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace , 68.0, 60.0, 26.0) text:nil textFont:15 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    //NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:[UIColor redColor]
    NSMutableAttributedString *bid = [[NSMutableAttributedString alloc] initWithString:@"host" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:kBlackColor,NSKernAttributeName:@(1),NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kGray2Color}];
    [boyId setAttributedText:bid];
    
    UILabel *girlId = [ZYCustomControls createLableWithFrame:CGRectMake(kScreenWidth - kNormSpace - 65.0, 68.0, 70.0, 26.0) text:@"host" textFont:15 textColor:kCyanColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    NSMutableAttributedString *gid = [[NSMutableAttributedString alloc] initWithString:@"hostess" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:kCyanColor,NSKernAttributeName:@(1),NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:kGray2Color}];
    [girlId setAttributedText:gid];
    
    NSMutableParagraphStyle *paragraph =  [NSMutableParagraphStyle new];
    paragraph.firstLineHeadIndent = 30;
    
    NSMutableAttributedString *contents = [[NSMutableAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kGrayColor,NSKernAttributeName:@(0.5)}];
    [contents  addAttribute:NSParagraphStyleAttributeName  value:paragraph range:NSMakeRange(0,contents.length)];
    UITextView *contentTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, 94.0, kScreenWidth, 90.0) vc:vc attributedString:contents editable:NO selectable:NO];
    
    NSArray *views = @[girlImg,boyImg,girlId,boyId,decoretionPic,contentTV];
    
    for (int i=0; i<[views count]; i++)
    {
        [pthv addSubview:views[i]];
    }
    
    return pthv;
}

@end
