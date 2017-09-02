//
//  ZYPrettyTimeImg_Cell.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPrettyTimeImg_Cell.h"

@implementation ZYPrettyTimeImg_Cell

-(instancetype)initCellWithFirstName:(NSString *)firstStr secondName:(NSString *)secondStr thirdName:(NSString *)thirdStr fourthName:(NSString *)fourthStr identifierString:(NSString *)cellId
{
    if (self = [super init])
    {
        _firstImgName = firstStr;
        _secondImgName = secondStr;
        _thirdImgName = thirdStr;
        _fourthImgName = fourthStr;
        self.restorationIdentifier = cellId;
    }
    return self;
}

-(instancetype)initWithImgNames:(NSArray *)names identifierString:(NSString *)cellId
{
    if (self = [super init])
    {
        ;
    }
    return self;
}

-(void)setFirstImgName:(NSString *)firstImgName
{
    _firstImgName = firstImgName;
    [self.firstImg setImage:[UIImage imageNamed:firstImgName]];
}

-(void)setSecondImgName:(NSString *)secondImgName
{
    _secondImgName = secondImgName;
    [self.secondImg setImage:[UIImage imageNamed:secondImgName]];
}

-(void)setThirdImgName:(NSString *)thirdImgName
{
    _thirdImgName = thirdImgName;
    [self.thirdImg setImage:[UIImage imageNamed:thirdImgName]];
}

-(void)setFourthImgName:(NSString *)fourthImgName
{
    _fourthImgName = fourthImgName;
    [self.fourthImg setImage:[UIImage imageNamed:fourthImgName]];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
