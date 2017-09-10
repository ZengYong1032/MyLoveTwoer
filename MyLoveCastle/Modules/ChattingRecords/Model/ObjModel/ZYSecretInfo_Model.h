//
//  ZYSecretInfo_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/3.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ZYDirectionType)
{
    ZYDirectionTypeLeft = 0,
    ZYDirectionTypeRight
};

@interface ZYSecretInfo_Model : NSObject

@property (nonatomic,strong) NSString *contents;
@property (nonatomic,strong) NSString *dateStr;
@property (nonatomic,assign) ZYDirectionType iDType;
@property (nonatomic,strong) NSString *nickStr;
@property (nonatomic,strong) NSString *headImgName;

@end
