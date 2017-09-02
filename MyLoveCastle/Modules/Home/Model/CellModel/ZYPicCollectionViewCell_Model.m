//
//  ZYPicCollectionViewCell_Model.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPicCollectionViewCell_Model.h"

@implementation ZYPicCollectionViewCell_Model

-(instancetype)initWithPicName:(NSString *)picname picTitle:(NSString *)pictitle identiferString:(NSString *)picCellId
{
    if (self = [super init])
    {
        _picName = picname;
        _picTitle = pictitle;
        self.restorationIdentifier = picCellId;
    }
    return self;
}

-(void)setPicName:(NSString *)picName
{
    _picName = picName;
    [_picView setImage:[UIImage imageNamed:picName]];
}

-(void)setPicTitle:(NSString *)picTitle
{
    _picTitle = picTitle;
    [_titleLab setText:picTitle];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

@end
