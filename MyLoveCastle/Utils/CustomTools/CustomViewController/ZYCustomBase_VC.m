//
//  ZYCustomBase_VC.m
//  MyAddressBook
//
//  Created by ZyZl on 2017/8/15.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYCustomBase_VC.h"

@interface ZYCustomBase_VC ()

@end

@implementation ZYCustomBase_VC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

-(void)setup
{
    [self.view setBackgroundColor:kWhiteColor];
    
    if (self.navigationController && [ZYViewTool isHavingControl:[UIScrollView class] target:self.view])
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)keyboardWillAppearanceWithNotification:(NSNotification *)notification
{
    //获取键盘弹起后的 frame
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //获取键盘弹起时的动画时长
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //获取键盘弹起时的动画选项
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect inputViewFrame = self.inputView.frame;
    inputViewFrame.origin.y = keyboardFrame.origin.y - inputViewFrame.size.height;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        //self.inputView.frame = inputViewFrame;
        //使用AutoLayout，那么动画就要用约束做
        [self.view setFrame:CGRectMake(0,-keyboardFrame.size.height, kScreenWidth, kScreenHeight)];
    } completion:nil];
    //如果是改变了约束，要执行刷新界面
    [self.view layoutIfNeeded];
}

-(void)keyboardWillHideWithNotification:(NSNotification *)notification
{
    //获取键盘弹起时的动画时长
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //获取键盘弹起时的动画选项
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    } completion:nil];
    
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
