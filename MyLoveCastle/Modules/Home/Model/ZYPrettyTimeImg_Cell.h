//
//  ZYPrettyTimeImg_Cell.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPrettyTimeImg_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *firstImg;
@property (weak, nonatomic) IBOutlet UIImageView *secondImg;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImg;
@property (weak, nonatomic) IBOutlet UIImageView *fourthImg;

@property (nonatomic,strong) NSString *firstImgName;
@property (nonatomic,strong) NSString *secondImgName;
@property (nonatomic,strong) NSString *thirdImgName;
@property (nonatomic,strong) NSString *fourthImgName;

-(instancetype)initCellWithFirstName:(NSString *)firstStr secondName:(NSString *)secondStr thirdName:(NSString *)thirdStr fourthName:(NSString *)fourthStr identifierString:(NSString *)cellId;

@end
