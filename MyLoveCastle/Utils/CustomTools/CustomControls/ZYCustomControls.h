//
//  ZYCustomControls.h
//  ControlsTest
//
//  Created by ZyZl on 2017/7/4.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ZYButtonType)
{
    ZYButtonTypeDefault = 0,
    ZYButtonTypeBack ,
    ZYButtonTypeCircle ,
    ZYButtonTypeAdd
};

@interface ZYCustomControls : NSObject

+(nullable UIButton *)createButtonWithFrame:(CGRect)frame type:(UIButtonType)bType title:(nullable NSString *)title textFont:(NSInteger)tFont titleColor:(nullable UIColor *)tColor borderWidth:(CGFloat) bWidth borderColor:(nullable UIColor *)bColor cornerRadius:(CGFloat)radius bgColor:(nullable UIColor *)bgColor bgImage:(nullable UIImage *)bgImage highImage:(nullable UIImage *)hImage tag:(NSInteger)btnTag;

+(nullable UIButton *)createDefaultButtonWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)tColor bgColor:(nullable UIColor *)bgColor customType:(ZYButtonType)bType;

+(nullable UIAlertController *)createAlertVCWithOneActionTitle:(nullable NSString *)oneAction otherActionTitle:(nullable NSString *)otherAction mainTitle:(nullable nullable NSString *)title detail:(nullable NSString *)detail handler:(void (^ __nullable)(UIAlertAction * __nullable action))handler;

+(nullable UILabel *)createLableWithFrame:(CGRect)frame text:(nullable NSString *)text textFont:(NSInteger)tFont textColor:(nullable UIColor *)tColor borderWidth:(CGFloat) bWidth borderColor:(nullable UIColor *)bColor cornerRadius:(CGFloat)radius bgColor:(nullable UIColor *)bgColor textAlignment:(NSTextAlignment)alignment tag:(NSInteger)labTag;

+(nullable UITextField *)createTextFieldWithTarget:(nullable id<UITextFieldDelegate>)target frame:(CGRect)frame placeholder:(nullable NSString *)phStr keyboardType:(UIKeyboardType)kbType returntype:(UIReturnKeyType)rkType tag:(NSInteger)intTag hasborder:(BOOL)isHaving;

+(nullable UIAlertController *)createAlertVCWithActionTitles:(nullable NSArray *)actionTitles style:(UIAlertControllerStyle)style mainTitle:(nullable NSString *)title detail:(nullable NSString *)detail oneHandler:(void (^__nullable)(UIAlertAction * _Nullable action))oneHandler otherHandler:(void (^__nullable)(UIAlertAction * _Nullable action))otherHandler;

+(nullable UITextView *)createTextViewWithFrame:(CGRect)frame vc:(nullable UIViewController<UITextViewDelegate> *)vc textFont:(NSInteger)tfont textColor:(nullable UIColor *)tColor bgColor:(nullable UIColor *)bgColor content:(nullable NSString *)content contentAlignment:(NSTextAlignment)tAlignment editable:(BOOL)isedit selectable:(BOOL)isselect contentInset:(UIEdgeInsets)insets;

+(nullable UITextView *)createTextViewWithFrame:(CGRect)frame vc:(nullable UIViewController<UITextViewDelegate> *)vc attributedString:(nullable NSAttributedString *)attributedStrig editable:(BOOL)isedit selectable:(BOOL)isselect;

@end
