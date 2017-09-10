//
//  ZYAnniversary_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYAnniversary_Model : NSObject

@property (nonatomic,strong) NSString *anniName;
@property (nonatomic,strong) NSString *slogan;
@property (nonatomic,strong) NSString *dateStr;
@property (nonatomic,strong) NSString *bgImgName;
@property (nonatomic,strong) NSAttributedString *planContent;
@property (nonatomic,strong) NSAttributedString *descriptionContent;
@property (nonatomic,strong) NSString *annCount;
@property (nonatomic) NSUInteger anniID;

@end
