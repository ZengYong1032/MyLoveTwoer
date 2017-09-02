//
//  ZYLogInfo_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLogInfo_Model : NSObject

@property (nonatomic,strong) NSString *logTitle;
@property (nonatomic,strong) NSString *nickStr;
@property (nonatomic,strong) NSString *dateStr;
@property (nonatomic,strong) NSString *headImgName;
@property (nonatomic,strong) NSMutableAttributedString *contents;

@end
