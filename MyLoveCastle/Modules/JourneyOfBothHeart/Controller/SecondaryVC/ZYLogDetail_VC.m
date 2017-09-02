//
//  ZYLogDetail_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYLogDetail_VC.h"

#define kTitleLabH 36.0
#define kPViewH 68.0

@interface ZYLogDetail_VC ()<UIScrollViewDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate>

@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UITextView *contentTV;
@property (nonatomic,strong) UIScrollView *baseView;
@property (nonatomic,strong) ZYPersonalView_Model *personalInfoView;
@property (nonatomic,strong) UIButton *handleButton;
@property (nonatomic,strong) UITableView *popTableView;
@property (nonatomic,strong) NSArray *handlesArray;
@property (nonatomic,strong) UIViewController *contentVC;

@end

@implementation ZYLogDetail_VC

-(NSArray *)handlesArray
{
    if (!_handlesArray)
    {
        _handlesArray = @[@"Share",@"Edit",@"Delete"];
    }
    return _handlesArray;
}

-(UITableView *)popTableView
{
    if (!_popTableView)
    {
        _popTableView = [[UITableView alloc] initWithFrame:CGRectMake(-10, 0, 110.0, 150.0) style:UITableViewStylePlain];
        _popTableView.delegate = self;
        _popTableView.dataSource = self;
    }
    return _popTableView;
}

-(UIScrollView *)baseView
{
    if (!_baseView)
    {
        _baseView = [[UIScrollView alloc] initWithFrame:kScreen_Bounds];
        [_baseView setContentSize:CGSizeMake(kScreenWidth, self.contentTV.frame.size.height + self.contentTV.frame.origin.y)];
        _baseView.delegate = self;
        _baseView.showsVerticalScrollIndicator = YES;
        _baseView.showsHorizontalScrollIndicator = NO;
        _baseView.scrollEnabled = YES;
//        [_baseView setBackgroundColor:kCustomGrayColor(0.9, 1.0)];
    }
    return _baseView;
}

-(ZYPersonalView_Model *)personalInfoView
{
    if (!_personalInfoView)
    {
        _personalInfoView = [ZYPersonalView_Model createPersonalInfoViewWithpersonalInnfoModel:self.theLogInfo frame:CGRectMake(0, kNavgationBarBaseY + kTitleLabH + kStandardSpace, kScreenWidth, kPViewH)];
    }
    return _personalInfoView;
}

-(UITextView *)contentTV
{
    if (!_contentTV)
    {
        _contentTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, kNavgationBarBaseY + kTitleLabH + kStandardSpace + kPViewH, kScreenWidth, [ZYStringTool computeAttributedStringSizeWithString:self.theLogInfo.contents tvWidth:kScreenWidth]) vc:self attributedString:self.theLogInfo.contents editable:NO selectable:NO];
    }
    return _contentTV;
}

-(UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [ZYCustomControls createLableWithFrame:CGRectMake(0, kNavgationBarBaseY, kScreenWidth, kTitleLabH) text:self.theLogInfo.logTitle textFont:20.0 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kClearColor textAlignment:NSTextAlignmentCenter tag:0];
    }
    return _titleLab;
}

-(UIButton *)handleButton
{
    if (!_handleButton)
    {
        _handleButton = [ZYCustomControls createButtonWithFrame:CGRectMake(0, 0, 50.0, 30.0) type:UIButtonTypeCustom title:@"" textFont:0 titleColor:kClearColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kClearColor bgImage:[UIImage imageNamed:@"handle_n.png"] highImage:[UIImage imageNamed:@"handle_s.png"] tag:0];
        [_handleButton addTarget:self action:@selector(skipToPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _handleButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    self.title = self.theLogInfo.logTitle;
    [super setup];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.handleButton];
    
    [self.baseView addSubview:self.titleLab];
    [self.baseView addSubview:self.personalInfoView];
    [self.baseView addSubview:self.contentTV];
    
    [self.view addSubview:self.baseView];
}

#pragma mark ---- UITable View Data Source & Delegate Methods ----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.handlesArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (150.0 / self.handlesArray.count);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HandleCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HandlesCell"];
    }
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setText:self.handlesArray[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [UIView animateWithDuration:0.5 animations:^{
    [self dismissViewControllerAnimated:self.contentVC completion:nil];
             }];
}

-(void)skipToPopView
{
    self.contentVC = [UIViewController new];//初始化内容视图控制器
    self.contentVC.preferredContentSize = CGSizeMake(100, 150);
    self.contentVC.modalPresentationStyle = UIModalPresentationPopover;
    [self.contentVC.view addSubview:self.popTableView];
    UIPopoverPresentationController *handlePopC = self.contentVC.popoverPresentationController;//初始化一个popover
        handlePopC.delegate = self;
    handlePopC.barButtonItem = self.navigationItem.rightBarButtonItem;//设置popover的来源按钮
    
    [self presentViewController:self.contentVC animated:YES completion:nil];//推出
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


@end
