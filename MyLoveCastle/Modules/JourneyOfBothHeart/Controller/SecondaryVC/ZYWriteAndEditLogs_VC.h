//
//  ZYWriteAndEditLogs_VC.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYCustomBase_VC.h"

typedef NS_ENUM(NSInteger,ZYHandleType)
{
    ZYHandleTypeWrite = 0,
    ZYHandleTypeModify
};

@interface ZYWriteAndEditLogs_VC : ZYCustomBase_VC

@property (nonatomic,strong) ZYLogInfo_Model *sourceLogInfo;
@property (nonatomic,assign) ZYHandleType handleType;

@end
