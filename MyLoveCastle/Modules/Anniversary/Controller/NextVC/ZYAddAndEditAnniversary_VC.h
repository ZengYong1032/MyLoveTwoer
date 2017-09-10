//
//  ZYAddAndEditAnniversary_VC.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYCustomBase_VC.h"

typedef NS_ENUM(NSInteger,ZYAnniOperationType)
{
    ZYAnniOpationTypeAddNewDay = 0,
    ZYAnniOpationTypeShow
};

@interface ZYAddAndEditAnniversary_VC : ZYCustomBase_VC

@property (nonatomic,strong) ZYAnniversary_Model *anniModel;
@property (nonatomic,assign) ZYAnniOperationType operationType;

@end
