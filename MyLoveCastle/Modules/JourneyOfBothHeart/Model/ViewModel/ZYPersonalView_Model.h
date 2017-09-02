//
//  ZYPersonalView_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPersonalView_Model : UIView

@property (nonatomic,strong) ZYLogInfo_Model *logPersonalInfo;

+(ZYPersonalView_Model *)createPersonalInfoViewWithpersonalInnfoModel:(ZYLogInfo_Model *)logInfo frame:(CGRect)frame;

@end
