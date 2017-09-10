//
//  ZYSecretRightCell_Model.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/6.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYSecretRightCell_Model.h"

@implementation ZYSecretRightCell_Model

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.messageLab.layer.borderWidth = 0.5;
    self.messageLab.layer.borderColor = kBorderColor.CGColor;
    self.messageLab.layer.cornerRadius = kButtonCorneRadius;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
