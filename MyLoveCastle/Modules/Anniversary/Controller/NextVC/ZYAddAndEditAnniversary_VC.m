//
//  ZYAddAndEditAnniversary_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/8.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYAddAndEditAnniversary_VC.h"

typedef NS_ENUM(NSInteger,ZYPickerViewType)
{
    ZYPickerViewTypeDate = 0,
    ZYPickerViewTypeAnniName,
    ZYPickerViewTypeBGImage
};

#define TitleLabWdith 140.0
#define PickerViewHeight 200.0
#define TVHeight 100.0
#define HeadlinHeight 50.0

@interface ZYAddAndEditAnniversary_VC ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>

@property (nonatomic,strong) UIButton *anniNameButton;
@property (nonatomic,strong) UIButton *dateButton;
@property (nonatomic,strong) UIButton *bgImgButton;
@property (nonatomic,strong) UITextView *descriptionTV;
@property (nonatomic,strong) UITextView *planTV;
@property (nonatomic,strong) UIDatePicker *datepicker;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIButton *confirmButton;
@property (nonatomic,strong) UIButton *editOrFineButton;

@property (nonatomic,strong) NSMutableArray *anniversaryNamesArray;
@property (nonatomic,strong) NSMutableArray *bgArray;

@property (nonatomic,assign) ZYPickerViewType ptype;

@end

@implementation ZYAddAndEditAnniversary_VC

-(UIButton *)anniNameButton
{
    if (!_anniNameButton)
    {
        _anniNameButton = [ZYCustomControls createButtonWithFrame:CGRectMake(TitleLabWdith + kNormSpace * 2.0, kNormSpace * 13.0, kScreenWidth - TitleLabWdith - kNormSpace * 3.0, 40.0) type:UIButtonTypeCustom title:(self.operationType == ZYAnniOpationTypeAddNewDay ? @"choose one anniName." : self.anniModel.anniName) textFont:15 titleColor:kBlueColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kOrangeColor bgImage:nil highImage:nil tag:90800];
        [_anniNameButton addTarget:self action:@selector(chooseTargetContent:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kNormSpace * 13.0, TitleLabWdith, 40.0) text:@"" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kGray2Color textAlignment:NSTextAlignmentCenter tag:0];
        [nameLab setAttributedText:[ZYConvertTool sharedTitleAttributedString:@"Anniversary Name:"]];
        
        [self.view addSubview:nameLab];
    }
    return _anniNameButton;
}

-(UIButton *)dateButton
{
    if (!_dateButton)
    {
        _dateButton = [ZYCustomControls createButtonWithFrame:CGRectMake(TitleLabWdith + kNormSpace * 2.0, kNormSpace * 19.0, kScreenWidth - TitleLabWdith - kNormSpace * 3.0, 40.0) type:UIButtonTypeCustom title:(self.operationType == ZYAnniOpationTypeAddNewDay ? @"choose anniDate." : self.anniModel.dateStr) textFont:15 titleColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kClearColor cornerRadius:kButtonCorneRadius bgColor:kOrangeColor bgImage:nil highImage:nil tag:90801];
        [_dateButton addTarget:self action:@selector(chooseTargetContent:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kNormSpace * 19.0, TitleLabWdith, 40.0) text:@"" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kGray2Color textAlignment:NSTextAlignmentCenter tag:0];
        
        [nameLab setAttributedText:[ZYConvertTool sharedTitleAttributedString:@"Anniversary Date:"]];
        
        [self.view addSubview:nameLab];
    }
    return _dateButton;
}

-(UIButton *)bgImgButton
{
    if (!_bgImgButton)
    {
        _bgImgButton = [ZYCustomControls createButtonWithFrame:CGRectMake(TitleLabWdith + kNormSpace * 2.0, kNormSpace * 25.0, kScreenWidth - TitleLabWdith - kNormSpace * 3.0, 40.0) type:UIButtonTypeCustom title:(self.operationType == ZYAnniOpationTypeAddNewDay ? @"choose one bgImg." : self.anniModel.bgImgName) textFont:15 titleColor:kWhiteColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kOrangeColor bgImage:nil highImage:nil tag:90802];
        [_bgImgButton addTarget:self action:@selector(chooseTargetContent:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *nameLab = [ZYCustomControls createLableWithFrame:CGRectMake(kNormSpace, kNormSpace * 25.0, TitleLabWdith, 40.0) text:@"" textFont:15 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kGray2Color textAlignment:NSTextAlignmentCenter tag:0];
        [nameLab setAttributedText:[ZYConvertTool sharedTitleAttributedString:@"BG Img:"]];
        
        [self.view addSubview:nameLab];
    }
    return _bgImgButton;
}

-(NSMutableArray *)anniversaryNamesArray
{
    if (!_anniversaryNamesArray)
    {
        _anniversaryNamesArray = [NSMutableArray arrayWithObjects:@"Loves",@"Hands",@"Marriage",@"First Face",@"Kissing",@"Other", nil];
    }
    return _anniversaryNamesArray;
}

-(NSMutableArray *)bgArray
{
    if (!_bgArray)
    {
        _bgArray = [NSMutableArray arrayWithObjects:@"love.png",@"hands.png",@"marriage.png",@"face.png",@"kiss.png",@"nomal.png", nil];
    }
    return _bgArray;
}

-(UIDatePicker *)datepicker
{
    if (!_datepicker)
    {
        _datepicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40.0, kScreenWidth, PickerViewHeight - 20.0)];
        _datepicker.maximumDate = [NSDate date];
        _datepicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datepicker;
}

-(UIView *)bgView
{
    if (!_bgView)
    {
        _bgView =[[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - PickerViewHeight - 40.0, kScreenWidth, PickerViewHeight + 40.0)];
        _bgView.layer.borderWidth = kButtonBorderWidth;
        _bgView.layer.borderColor = kBorderColor.CGColor;
        [_bgView addSubview:self.confirmButton];
        [_bgView addSubview:self.datepicker];
    }
    return _bgView;
}

-(UIButton *)confirmButton
{
    if (!_confirmButton)
    {
        _confirmButton = [ZYCustomControls createButtonWithFrame:CGRectMake(kScreenWidth - 60.0, 4.0, 50.0, 30.0) type:UIButtonTypeCustom title:@"Sure" textFont:16 titleColor:kOrangeColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kCyanColor bgImage:nil highImage:nil tag:0];
        [_confirmButton addTarget:self action:@selector(chooseAnniversaryDate) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

-(UITextView *)descriptionTV
{
    if (!_descriptionTV)
    {
        _descriptionTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, kNormSpace * 36.0, kScreenWidth - kNormSpace * 0.0, TVHeight) vc:self attributedString:(self.operationType == ZYAnniOpationTypeAddNewDay ? [[NSMutableAttributedString alloc] initWithString:@"There is no description of the anniversary." attributes:@{NSFontAttributeName:SYSTEMFONT(16),NSForegroundColorAttributeName:kCyanColor}] : self.anniModel.descriptionContent) editable:NO selectable:NO];

        UIImageView *labImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0 , kNormSpace * 32.0, kScreenWidth, 40.0)];
        [labImgView setImage:[UIImage imageNamed:@"descripation.png"]];
        [self.view addSubview:labImgView];
    }
    return _descriptionTV;
}

-(UITextView *)planTV
{
    if (!_planTV)
    {
        _planTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, kNormSpace * 43.0 + TVHeight, kScreenWidth, TVHeight) vc:self attributedString:(self.operationType == ZYAnniOpationTypeAddNewDay ? [[NSMutableAttributedString alloc] initWithString:@"There is no plan of the anniversary." attributes:@{NSFontAttributeName:SYSTEMFONT(16),NSForegroundColorAttributeName:kBlackColor}] : self.anniModel.planContent) editable:NO selectable:NO];
        
        UIImageView *labImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0 , kNormSpace * 38.0 + TVHeight, kScreenWidth, 40.0)];
        [labImgView setImage:[UIImage imageNamed:@"plans.png"]];
        [self.view addSubview:labImgView];
    }
    return _planTV;
}

-(UIButton *)editOrFineButton
{
    if (!_editOrFineButton)
    {
        _editOrFineButton = [ZYCustomControls createButtonWithFrame:CGRectMake(0, 0, kRightBarItemWidth, kStandardButtonHeight) type:UIButtonTypeCustom title:(self.operationType == ZYAnniOpationTypeAddNewDay ? @"Fine" : @"Edit") textFont:16 titleColor:(self.operationType == ZYAnniOpationTypeAddNewDay ? kWhiteColor : kCustomColor(255, 83, 73, 1.0)) borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:(self.operationType == ZYAnniOpationTypeAddNewDay ? kOrangeColor : kCustomColor(127, 255, 212, 1.0))  bgImage:nil highImage:nil tag:0];
        
        [_editOrFineButton addTarget:self action:@selector(handleOperations:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editOrFineButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    self.title = @"NewDay";
    
    [self setupHeadlineImageView];
    
    [self.view addSubview:self.anniNameButton];
    [self.view addSubview:self.dateButton];
    [self.view addSubview:self.bgImgButton];
    [self.view addSubview:self.descriptionTV];
    [self.view addSubview:self.planTV];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.editOrFineButton];
    
    if (self.operationType == ZYAnniOpationTypeAddNewDay)
    {
        [self setEditState];
    }
    else
    {
        [self closeEditState];
    }
}

-(void)setupHeadlineImageView
{
    UIImageView *basicImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNormSpace * 7.0, kScreenWidth, HeadlinHeight)];
    [basicImageView setImage:[UIImage imageNamed:@"basicInfo.png"]];
    
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(kSmallSpace, kNormSpace * 11.5, kScreenWidth - kSmallSpace * 2.0, kNormSpace * 18.5)];
    [bgV setBackgroundColor:kWhiteColor];
    bgV.layer.borderColor = kGray2Color.CGColor;
    bgV.layer.borderWidth = kButtonBorderWidth;
    bgV.layer.cornerRadius = kButtonCorneRadius;
    
    [self.view addSubview:bgV];
    [self.view addSubview:basicImageView];
}

#pragma mark ---- UIPicker View Data Source & Delegate Methods ----

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rowCount;
    
    if (self.ptype == ZYPickerViewTypeBGImage)
    {
        rowCount = [self.bgArray count];
    }
    else if (self.ptype == ZYPickerViewTypeAnniName)
    {
        rowCount = [self.anniversaryNamesArray count];
    }
    else
    {
        rowCount = 5.0;
    }
    
    return rowCount;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *titleStr;
    if (self.ptype == ZYPickerViewTypeBGImage)
    {
        titleStr = self.bgArray [row];
    }
    else if (self.ptype == ZYPickerViewTypeAnniName)
    {
        titleStr = self.anniversaryNamesArray [row];
    }
    else
    {
        titleStr = @"";
    }
    
    return titleStr;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.ptype == ZYPickerViewTypeBGImage)
    {
        [self.bgImgButton setTitle:self.bgArray[row] forState:UIControlStateNormal];
        [pickerView removeFromSuperview];
        pickerView = nil;
    }
    else if (self.ptype == ZYPickerViewTypeAnniName)
    {
        [self.anniNameButton setTitle:self.anniversaryNamesArray[row] forState:UIControlStateNormal];
        [pickerView removeFromSuperview];
        pickerView = nil;
    }
}

-(void)chooseTargetContent:(UIButton *)sender
{
    [self closePickerView];
    
    switch (sender.tag)
    {
        case 90800:
            [self skipToPickerView:ZYPickerViewTypeAnniName];
            break;
            
        case 90801:
            [self skipToPickerView:ZYPickerViewTypeDate];
            break;

        case 90802:
            [self skipToPickerView:ZYPickerViewTypeBGImage];
            break;
            
        default:
            break;
    }
}

-(void)skipToPickerView:(ZYPickerViewType)pickerType
{
    self.ptype = pickerType;
    
    if (pickerType == ZYPickerViewTypeDate)
    {
        [self.view addSubview:self.bgView];
    }
    else
    {
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenHeight - PickerViewHeight, kScreenWidth, PickerViewHeight - 20.0)];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        
        [self.view addSubview:self.pickerView];
    }
}

-(void)chooseAnniversaryDate
{
    NSDate *date = self.datepicker.date;
    [self.dateButton setTitle:[ZYConvertTool dateConvertToString:date format:ZYDate] forState:UIControlStateNormal];
    [self closePickerView];
}

-(void)closePickerView
{
    [self.pickerView removeFromSuperview];
    [self.datepicker removeFromSuperview];
    [self.confirmButton removeFromSuperview];
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    self.confirmButton = nil;
    self.datepicker = nil;
    self.pickerView = nil;
}

-(void)handleOperations:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"Edit"])
    {
        [sender setTitle:@"Fine" forState:UIControlStateNormal];
        [sender setBackgroundColor:kOrangeColor];
        [self setEditState];
    }
    else
    {
        [self closeEditState];
        
        if (self.operationType == ZYAnniOpationTypeAddNewDay)
        {
            ZYAnniversary_Model *am = [ZYAnniversary_Model new];
            am.anniName = self.anniNameButton.titleLabel.text;
            am.slogan = NSStringFormat(@"%@ %@ Anniversary !!",self.anniNameButton.titleLabel.text,[ZYConvertTool getDateDifferenceWithDateString:self.dateButton.titleLabel.text]);
            am.dateStr = self.dateButton.titleLabel.text;
            am.bgImgName = self.bgImgButton.titleLabel.text;
            am.planContent = [ZYConvertTool sharedDecriptionAttributedString:@"Have no plan."];
            am.annCount = NSStringFormat(@"%@  anniversaries",[ZYConvertTool getDateDifferenceWithDateString:self.dateButton.titleLabel.text]);
            am.descriptionContent = self.descriptionTV.attributedText;
            am.anniID = [kAppDelegate.anniDataArray count];
            
            [kAppDelegate.anniDataArray addObject:am];
        }
        else
        {
            self.anniModel.anniName = self.anniNameButton.titleLabel.text;
            self.anniModel.dateStr = self.dateButton.titleLabel.text;
            self.anniModel.bgImgName = self.bgImgButton.titleLabel.text;
            self.anniModel.descriptionContent = self.descriptionTV.attributedText;
            self.anniModel.annCount = NSStringFormat(@"%@  anniversaries",[ZYConvertTool getDateDifferenceWithDateString:self.dateButton.titleLabel.text]);
            [kAppDelegate.anniDataArray replaceObjectAtIndex:self.anniModel.anniID withObject:self.anniModel];
        }
        
        [self backToSuperNavigationC];
    }
}

-(void)setEditState
{
    self.anniNameButton.userInteractionEnabled = YES;
    self.dateButton.userInteractionEnabled = YES;
    self.bgImgButton.userInteractionEnabled = YES;
    self.descriptionTV.editable = YES;
    self.descriptionTV.selectable = YES;
    self.descriptionTV.scrollEnabled = YES;
}

-(void)closeEditState
{
    self.anniNameButton.userInteractionEnabled = NO;
    self.dateButton.userInteractionEnabled = NO;
    self.bgImgButton.userInteractionEnabled = NO;
    self.descriptionTV.editable = NO;
    self.descriptionTV.selectable = NO;
    self.descriptionTV.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
