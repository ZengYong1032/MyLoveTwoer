//
//  ZYPrettyTimeImg_Cell.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPrettyTimeImg_Cell.h"

@implementation ZYPrettyTimeImg_Cell

-(instancetype)initCellWithFirstName:(NSString *)firstStr secondName:(NSString *)secondStr thirdName:(NSString *)thirdStr fourthName:(NSString *)fourthStr
{
    if (self = [super init])
    {
        [self.firstImg setImage:[UIImage imageNamed:firstStr]];
        [self.secondImg setImage:[UIImage imageNamed:secondStr]];
        [self.thirdImg setImage:[UIImage imageNamed:thirdStr]];
        [self.fourthImg setImage:[UIImage imageNamed:fourthStr]];
    }
    return self;
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
