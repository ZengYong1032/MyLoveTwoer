//
//  ZYCustomBase_VC.h
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYCustomBase_VC : UIViewController

-(void)setup;
-(void)keyboardWillHideWithNotification:(NSNotification *)notification;
-(void)keyboardWillAppearanceWithNotification:(NSNotification *)notification;

@end
