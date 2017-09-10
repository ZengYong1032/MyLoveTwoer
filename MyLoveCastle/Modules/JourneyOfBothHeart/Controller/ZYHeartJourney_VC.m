//
//  ZYHeartJourney_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYHeartJourney_VC.h"

@interface ZYHeartJourney_VC ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic,strong) UISegmentedControl *
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UITextView *abstractTV;
@property (nonatomic,strong) UITableView *journeyTableView;

@property (nonatomic,strong) NSMutableDictionary *dataDictionary;

@end

@implementation ZYHeartJourney_VC

-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary)
    {
        NSMutableArray *news = [NSMutableArray array];
        
        for (ZYLogInfo_Model *info in kAppDelegate.newsLogArray)
        {
            [news addObject:info.logTitle];
        }
        
        _dataDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@[@"Growth Ring",@"Dynamic"],@"SectionTitle",@[@[@"Luck Start",@"Luck Pause",@"To Renew"],news],@"CellData", nil];
    }
    return _dataDictionary;
}

-(UITableView *)journeyTableView
{
    if (!_journeyTableView)
    {
        _journeyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 254.0, kScreenWidth, kScreenHeight - 304.0) style:UITableViewStyleGrouped];
        _journeyTableView.delegate = self;
        _journeyTableView.dataSource = self;
        [_journeyTableView setSectionFooterHeight:0];
        [_journeyTableView setSectionHeaderHeight:36.0];
    }
    return _journeyTableView;
}

-(UITextView *)abstractTV
{
    if (!_abstractTV)
    {
        _abstractTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, 100.0, kScreenWidth, 154.0) vc:self attributedString:[self getAttributedString] editable:NO selectable:NO];
        UILabel *titleLab = [ZYCustomControls createLableWithFrame:CGRectMake(0, 64.0, kScreenWidth, 36.0) text:@"   The First:" textFont:18 textColor:kBlackColor borderWidth:0 borderColor:kClearColor cornerRadius:0 bgColor:kGray2Color textAlignment:NSTextAlignmentLeft tag:0];
        [self.view addSubview:titleLab];
    }
    return _abstractTV;
}

-(UIButton *)rightButton
{
    if (!_rightButton)
    {
        _rightButton = [ZYCustomControls createButtonWithFrame:CGRectMake(0, 0, 80.0, 30.0) type:UIButtonTypeCustom title:@"Write Log" textFont:13 titleColor:kBlueColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kGreenColor bgImage:nil highImage:nil tag:0];
        [_rightButton addTarget:self action:@selector(skipToWriteLogVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    [self.view addSubview:self.abstractTV];
    [self.view addSubview:self.journeyTableView];
}

#pragma mark ---- Write Log Method ----
-(void)skipToWriteLogVC
{
    ZYWriteAndEditLogs_VC *waeVC = [ZYWriteAndEditLogs_VC new];
    waeVC.handleType = ZYHandleTypeWrite;
    
    [self.navigationController pushViewController:waeVC animated:YES];
}

#pragma mark ---- Convert Description String Method ----
-(NSMutableAttributedString *)getAttributedString
{
    NSArray *stringArray = @[@"First Face:",@"  2017-01-16 , WuGuiQiao Station.\n",@"Be Moved At First:",@"  2017-1-16,buy ticket at the LuZhou Station.\n",@"Give First Gift: ",@"  2017-06-22 (her 21 birthday).\n",@"Pledge Love: ",@"  2017-08-27(QiXi).\n"];
    NSMutableAttributedString *ass = [[NSMutableAttributedString alloc] init];
    
    int i=1;
    for (NSString *string in stringArray)
    {
        NSMutableAttributedString *as = [[NSMutableAttributedString alloc] init];
        
        if (i%2 == 0)
        {
            as = [ZYConvertTool stringConvertToAttributeString:string fontSize:15.0 kernSzie:1 tcolor:kCyanColor firstHeadIndent:0 isHaveunderLine:NO  isZapFont:NO];
        }
        else
        {
            as = [ZYConvertTool stringConvertToAttributeString:string fontSize:8.0 kernSzie:1 tcolor:kOrangeColor firstHeadIndent:10.0 isHaveunderLine:NO  isZapFont:YES];
        }
        
        [ass appendAttributedString:as];
        i++;
    }
    
    return ass;
}

#pragma mark ---- UITable View Data Source & Delegate Methods ----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataDictionary[@"SectionTitle"] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36.0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.dataDictionary[@"SectionTitle"][section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataDictionary[@"CellData"][section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JourneyCell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"JourneyCell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    [cell.textLabel setText:(self.dataDictionary[@"CellData"][indexPath.section][indexPath.row])];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        ZYLogDetail_VC *ldvc = [ZYLogDetail_VC new];
        ldvc.theLogInfo = kAppDelegate.newsLogArray[indexPath.row];
        [self.navigationController pushViewController:ldvc animated:YES];
    }
    else
    {
        ZYLogList_VC *loglistVC = [ZYLogList_VC new];
        
        loglistVC.logsListDataArray = @[kAppDelegate.oldLogArray[indexPath.row],[kAppDelegate.oldLogArray lastObject]];
        [self.navigationController pushViewController:loglistVC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.dataDictionary = nil;
    [self.journeyTableView reloadData];
}

@end
