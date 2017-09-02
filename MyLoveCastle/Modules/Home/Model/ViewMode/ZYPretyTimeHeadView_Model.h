//
//  ZYPretyTimeHeadView_Model.h
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPretyTimeHeadView_Model : UIView

+(ZYPretyTimeHeadView_Model *)createPretyTimeHeadViewWithTarget:(UIViewController<UITextViewDelegate> *)vc frame:(CGRect)frame headshots:(NSArray *)headshots content:(NSString *)content;

@end
