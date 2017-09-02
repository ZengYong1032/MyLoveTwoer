//
//  ZYPicCollectionViewCell_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPicCollectionViewCell_Model : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic,strong) NSString *picName;
@property (nonatomic,strong) NSString *picTitle;

-(instancetype)initWithPicName:(NSString *)picname picTitle:(NSString *)pictitle identiferString:(NSString *)picCellId;

@end
