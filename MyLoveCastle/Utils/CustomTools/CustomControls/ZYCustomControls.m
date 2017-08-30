//
//  ZYCustomControls.m
//  ControlsTest
//
//  Created by ZyZl on 2017/7/4.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYCustomControls.h"

@implementation ZYCustomControls

+(UIButton *)createDefaultButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)tColor bgColor:(UIColor *)bgColor customType:(ZYButtonType)bType
{
    UIButton *customButton = [UIButton buttonWithType:bType == ZYButtonTypeAdd ? UIButtonTypeContactAdd : UIButtonTypeCustom];
    [customButton setFrame:frame];
    [customButton setBackgroundColor:bgColor];
    
    int tf = 16;
    
        while (([ZYStringTool removeWhitespaceAndNewlineCharacterSetFromString:[ZYStringTool removeSpaceFromString:title]].length - 3) * tf > frame.size.width)
        {
            tf--;
        }
    
    switch (bType)
    {
        case ZYButtonTypeDefault:
            customButton.layer.borderWidth = kButtonBorderWidth;
            customButton.layer.borderColor = kBorderColor.CGColor;
            customButton.layer.cornerRadius = kButtonCorneRadius;
            [customButton.titleLabel setFont:SYSTEMFONT(16)];
            [customButton setTitle:title forState:UIControlStateNormal];
            [customButton setTitleColor:tColor forState:UIControlStateNormal];
            break;
            
        case ZYButtonTypeAdd:
            customButton.layer.borderWidth = kButtonBorderWidth;
            customButton.layer.borderColor = kBorderColor.CGColor;
            customButton.layer.cornerRadius = kButtonCorneRadius;
            break;
            
        case ZYButtonTypeBack:
            customButton.layer.borderWidth = kButtonBorderWidth;
            customButton.layer.borderColor = kBorderColor.CGColor;
            customButton.layer.cornerRadius = kButtonCorneRadius;
            [customButton.titleLabel setFont:SYSTEMFONT(tf)];
            [customButton setTitle:@"<<" forState:UIControlStateNormal];
            [customButton setTitleColor:tColor forState:UIControlStateNormal];
            break;
            
        case ZYButtonTypeCircle:
            customButton.layer.borderWidth = kButtonBorderWidth;
            customButton.layer.borderColor = kBorderColor.CGColor;
            customButton.layer.cornerRadius = frame.size.height * 0.5;
            [customButton setTitle:title forState:UIControlStateNormal];
            [customButton setTitleColor:tColor forState:UIControlStateNormal];
            [customButton.titleLabel setFont:SYSTEMFONT(tf)];
            break;
            
        default:
            break;
    }
    
    return customButton;
}

+(UIButton *)createButtonWithFrame:(CGRect)frame type:(UIButtonType)bType title:(NSString *)title textFont:(NSInteger)tFont titleColor:(UIColor *)tColor borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor cornerRadius:(CGFloat)radius bgColor:(UIColor *)bgColor bgImage:(UIImage *)bgImage highImage:(UIImage *)hImage tag:(NSInteger)btnTag
{
    UIButton *customButton = [UIButton buttonWithType:bType];
    [customButton setFrame:frame];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:tColor forState:UIControlStateNormal];
    customButton.layer.borderWidth = bWidth;
    customButton.layer.borderColor = bColor.CGColor;
    customButton.layer.cornerRadius = radius;
    [customButton setBackgroundColor:bgColor];
    if (bgImage)
     {
         [customButton setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    
    if (hImage)
     {
         [customButton setBackgroundImage:hImage forState:UIControlStateHighlighted];
    }
    
    if (btnTag && btnTag > 900)
     {
         [customButton setTag:btnTag];
    }
    
    if (tFont)
     {
         [customButton.titleLabel setFont:SYSTEMFONT(tFont)];
    }
    else
    {
        [customButton.titleLabel setFont:SYSTEMFONT(16)];
    }
    
    return customButton;
}

+(UIAlertController *)createAlertVCWithOneActionTitle:(NSString *)oneAction otherActionTitle:(NSString *)otherAction mainTitle:(NSString *)title detail:(NSString *)detail handler:(void (^)(UIAlertAction * _Nullable))handler
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:detail preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *one = [UIAlertAction actionWithTitle:oneAction style:UIAlertActionStyleDefault handler:handler];
    UIAlertAction *another = [UIAlertAction actionWithTitle:otherAction style:UIAlertActionStyleCancel handler:nil];
    
    [alertVC addAction:another];
    [alertVC addAction:one];
    
    return alertVC;
}

+(UIAlertController *)createAlertVCWithActionTitles:(NSArray *)actionTitles style:(UIAlertControllerStyle)style mainTitle:(NSString *)title detail:(NSString *)detail oneHandler:(void (^)(UIAlertAction * _Nullable))oneHandler otherHandler:(void (^)(UIAlertAction * _Nullable))otherHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:detail preferredStyle:style];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitles[0] style:UIAlertActionStyleDefault handler:oneHandler];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:actionTitles[1] style:UIAlertActionStyleDefault handler:otherHandler];
    UIAlertAction *anotherAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [alert addAction:otherAction];
    [alert addAction:anotherAction];
    
    return alert;
}

+(UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text textFont:(NSInteger)tFont textColor:(UIColor *)tColor borderWidth:(CGFloat)bWidth borderColor:(UIColor *)bColor cornerRadius:(CGFloat)radius bgColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)alignment tag:(NSInteger)labTag
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setText:text];
    [label setTextAlignment:alignment ? alignment : NSTextAlignmentLeft];
    [label setTextColor:tColor ? tColor : kBlackColor];
    [label setFont:SYSTEMFONT(tFont ? tFont : 16)];
    if (bWidth)
    {
        label.layer.borderWidth = bWidth;
    }
    if (bWidth && bWidth > 0 && bgColor)
    {
        label.layer.borderColor = bColor.CGColor;
    }
    if (radius)
    {
        label.layer.cornerRadius = radius;
    }
    if (labTag && labTag > 2000)
    {
        [label setTag:labTag];
    }
    if (bgColor)
    {
        [label setBackgroundColor:bgColor];
    }
    
    return label;
}

+(UITextField *)createTextFieldWithTarget:(id)target frame:(CGRect)frame placeholder:(NSString *)phStr keyboardType:(UIKeyboardType)kbType returntype:(UIReturnKeyType)rkType tag:(NSInteger)intTag hasborder:(BOOL)isHaving 
{
    UITextField *tf = [[UITextField alloc] initWithFrame:frame];
    tf.keyboardType = kbType;
    tf.delegate = target;
    tf.placeholder = phStr;
    if (kbType != UIKeyboardTypeNumberPad)
    {
        tf.returnKeyType = rkType;
    }
    tf.tag = intTag;
    
    if (isHaving)
    {
        tf.layer.borderWidth = 0.5;
        tf.layer.borderColor = kBorderColor.CGColor;
    }
    return tf;
}

+(UITextView *)createTextViewWithFrame:(CGRect)frame vc:(UIViewController<UITextViewDelegate> *)vc textFont:(NSInteger)tfont textColor:(UIColor *)tColor bgColor:(UIColor *)bgColor content:(NSString *)content contentAlignment:(NSTextAlignment)tAlignment editable:(BOOL)isedit selectable:(BOOL)isselect contentInset:(UIEdgeInsets)insets
{
    UITextView *tv = [[UITextView alloc] initWithFrame:frame];
    tv.delegate = vc;
    tv.font = SYSTEMFONT(tfont);
    [tv setTextColor:tColor];
    [tv setBackgroundColor:bgColor];
    [tv setText:content];
    [tv setTextAlignment:tAlignment];
    tv.editable = isedit;
    tv.selectable = isselect;
    
    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero))
    {
        [tv setContentInset:insets];//行内间距
    }
    
    return tv;
}

+(UITextView *)createTextViewWithFrame:(CGRect)frame vc:(UIViewController<UITextViewDelegate> *)vc attributedString:(NSAttributedString *)attributedStrig editable:(BOOL)isedit selectable:(BOOL)isselect
{
    UITextView *tv = [[UITextView alloc] initWithFrame:frame];
    [tv setAttributedText:attributedStrig];
    tv.editable = isedit;
    tv.selectable = isselect;
    tv.delegate = vc;
    
    return tv;
}

@end
