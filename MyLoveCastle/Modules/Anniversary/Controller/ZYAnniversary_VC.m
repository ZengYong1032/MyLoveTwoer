//
//  ZYAnniversary_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYAnniversary_VC.h"

#define SV_Y 80.0
#define SV_Height  150.0
#define SV_Width (kScreenWidth - kNormSpace * 2.0)
#define TV_Height 120.0

@interface ZYAnniversary_VC ()<UIScrollViewDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIButton *addNewAnniButton;
@property (nonatomic,strong) UIScrollView *anniversaryScrollView;
@property (nonatomic,strong) UIPageControl *anniversaryPageC;
@property (nonatomic,strong) UITableView *anniversaryNearlyTableView;
@property (nonatomic,strong) UITextView *planNearbyTV;
@property (nonatomic,strong) NSMutableArray *scrollDataArray;
@property (nonatomic,strong) NSMutableArray *annNearlyDataArray;
@property (nonatomic,strong) NSMutableArray *planNearbyDataArray;
@property (nonatomic,strong) NSTimer *svTimer;

@end

@implementation ZYAnniversary_VC

-(UIButton *)addNewAnniButton
{
    if (!_addNewAnniButton)
    {
        _addNewAnniButton = [ZYCustomControls createButtonWithFrame:CGRectMake(0, 0, 80.0, 30.0) type:UIButtonTypeCustom title:@"AddNewAnni" textFont:12 titleColor:kOrangeColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:kButtonCorneRadius bgColor:kCyanColor bgImage:nil highImage:nil tag:0];
        [_addNewAnniButton addTarget:self action:@selector(skipToAddNewAnniversaryVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addNewAnniButton;
}

-(NSMutableArray *)planNearbyDataArray
{
    if (!_planNearbyDataArray)
    {
        _planNearbyDataArray = [NSMutableArray arrayWithObjects:@"Going to sanya on our Wedding anniversary.\n",@"Going to DaLi on our Loves Day.\n",@"Making a nice meal for my hostess on our hands Day. ", nil];
    }
    return _planNearbyDataArray;
}

-(NSMutableArray *)scrollDataArray
{
    if (!_scrollDataArray)
    {
        _scrollDataArray = [NSMutableArray arrayWithArray:kAppDelegate.anniDataArray];
    }
    return _scrollDataArray;
}

-(UITextView *)planNearbyTV
{
    if (!_planNearbyTV)
    {
        _planNearbyTV = [ZYCustomControls createTextViewWithFrame:CGRectMake(0, SV_Height + SV_Y + 56.0, kScreenWidth, TV_Height) vc:self attributedString:[self getPlanNearbyAttributedString] editable:NO selectable:NO];
         UILabel *planTitle = [ZYCustomControls createLableWithFrame:CGRectMake(0 ,  SV_Height + SV_Y + 26.0 , kScreenWidth - kNormSpace * 0, 30.0) text:@"  Anniversary Nearby Plan:" textFont:16 textColor:kBlackColor borderWidth:kButtonBorderWidth borderColor:kBorderColor cornerRadius:0 bgColor:kGray2Color textAlignment:NSTextAlignmentLeft tag:0];
        [self.view addSubview:planTitle];
    }
    return _planNearbyTV;
}

-(UITableView *)anniversaryNearlyTableView
{
    if (!_anniversaryNearlyTableView)
    {
        _anniversaryNearlyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SV_Height + SV_Y + TV_Height + 80.0, kScreenWidth, kScreenHeight - (SV_Height + SV_Y + TV_Height + 140.0)) style:UITableViewStylePlain];
        _anniversaryNearlyTableView.delegate = self;
        _anniversaryNearlyTableView.dataSource = self;
        _anniversaryNearlyTableView.tableHeaderView = [ZYCustomControls createLableWithFrame:CGRectMake(0, 0, kScreenWidth, 30.0) text:@"   Anniversary Nearby :" textFont:17 textColor:kRedColor borderWidth:0.5 borderColor:kGrayColor cornerRadius:0 bgColor:kGrayColor textAlignment:NSTextAlignmentLeft tag:0];
    }
    return _anniversaryNearlyTableView;
}

-(UIPageControl *)anniversaryPageC
{
    if (!_anniversaryPageC)
    {
        _anniversaryPageC = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenWidth * 0.2, SV_Height + SV_Y - 24.0, kScreenWidth * 0.6, 30.0)];
        
        _anniversaryPageC.currentPageIndicatorTintColor = kOrangeColor;
        _anniversaryPageC.pageIndicatorTintColor = [UIColor greenColor];
        _anniversaryPageC.numberOfPages = self.scrollDataArray.count ;
        _anniversaryPageC.currentPage = 0;
    }
    return _anniversaryPageC;
}

-(UIScrollView *)anniversaryScrollView
{
    if (!_anniversaryScrollView)
    {
        _anniversaryScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kNormSpace, SV_Y, SV_Width, SV_Height)];
        _anniversaryScrollView.contentSize = CGSizeMake(SV_Width * [self.scrollDataArray count], 0);
        _anniversaryScrollView.showsVerticalScrollIndicator = NO;
        _anniversaryScrollView.showsHorizontalScrollIndicator = NO;
        
        _anniversaryScrollView.pagingEnabled = YES ;
        _anniversaryScrollView.delegate = self ;
        
        for (int i = 0; i < self.scrollDataArray.count; i++)
        {
            [_anniversaryScrollView addSubview:[ZYAnniRollView_Model createAnniRollViewWithAnniversaryModel:self.scrollDataArray[i] frame:CGRectMake(i * SV_Width, 0, SV_Width, SV_Height)]];
        }
    }
    return _anniversaryScrollView;
}

-(NSMutableArray *)annNearlyDataArray
{
    if (!_annNearlyDataArray)
    {
        _annNearlyDataArray = [NSMutableArray array];
        //WithObjects:@{@"annDate":((ZYAnniversary_Model *)self.scrollDataArray[0]).dateStr,@"anniName":((ZYAnniversary_Model *)self.scrollDataArray[0]).anniName},@{@"annDate":((ZYAnniversary_Model *)self.scrollDataArray[1]).dateStr,@"anniName":((ZYAnniversary_Model *)self.scrollDataArray[1]).anniName}, nil
        
        for (ZYAnniversary_Model *am in self.scrollDataArray)
        {
            if ([[ZYConvertTool getDayDifferenceWithDateString:am.dateStr][@"Interval"] integerValue] <= 100)
            {
                [_annNearlyDataArray addObject:am];
            }
        }
    }
    return _annNearlyDataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.anniversaryScrollView];
    [self.view addSubview:self.anniversaryPageC];
    [self.view addSubview:self.planNearbyTV];
    [self.view addSubview:self.anniversaryNearlyTableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.addNewAnniButton];
    
    [self addSVTimer];
}

-(void)scrollToNextView
{
    int page = 0 ;
    if (self.anniversaryPageC.currentPage == self.scrollDataArray.count - 1)
    {
        page = 0 ;
    }
    else
    {
        page = self.anniversaryPageC.currentPage * 1.0 + 1 ;
    }
    
    CGFloat offsetX = page * SV_Width ;
    CGPoint offSet = CGPointMake(offsetX, 0);
    [self.anniversaryScrollView setContentOffset:offSet animated:YES];

}

-(void)skipToAddNewAnniversaryVC
{
    ZYAddAndEditAnniversary_VC *aaeavc = [ZYAddAndEditAnniversary_VC new];
    aaeavc.operationType = ZYAnniOpationTypeAddNewDay;
    [self.navigationController pushViewController:aaeavc animated:YES];
}

-(NSMutableAttributedString *)getPlanNearbyAttributedString
{
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] init];
    
    int i=1;
    for (NSString *str in self.planNearbyDataArray)
    {
        NSAttributedString *mass = [ZYConvertTool stringConvertToAttributeString:NSStringFormat(@"%d. %@",i,str) fontSize:16 kernSzie:1 tcolor:kOrangeColor firstHeadIndent:30.0 isHaveunderLine:NO isZapFont:NO];
        [mas appendAttributedString:mass];
        i++;
    }
    return mas;
}

#pragma mark ---- UITable View Data Source & Delegate Methods ----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.annNearlyDataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnniNearbyCell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"AnniNearbyCell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell.detailTextLabel setTextColor:kOrangeColor];
        [cell.detailTextLabel setTextAlignment:NSTextAlignmentCenter];
        [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
        [cell.textLabel setTextColor:kCyanColor];
        [cell.textLabel setFont:SYSTEMFONT(18)];
    }
    
    [cell.textLabel setText:((ZYAnniversary_Model *)self.annNearlyDataArray[indexPath.row]).anniName];
    [cell.detailTextLabel setText:NSStringFormat(@"%@ day countdown",[ZYConvertTool getDayDifferenceWithDateString:((ZYAnniversary_Model *)self.annNearlyDataArray[indexPath.row]).dateStr][@"Interval"])];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYAddAndEditAnniversary_VC *aaeavc = [ZYAddAndEditAnniversary_VC new];
    aaeavc.operationType = ZYAnniOpationTypeShow;
    aaeavc.anniModel = self.annNearlyDataArray[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.navigationController pushViewController:aaeavc animated:YES];
}

#pragma mark ---- UIScroll View delegate methods -----

/**
 *  设置pageControl的currentPage
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x + 0.5 * scrollView.frame.size.width) / scrollView.frame.size.width ;
    self.anniversaryPageC.currentPage = page ;
}

/**
 *  适时移除timer
 */

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  适时添加timer
 */

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addSVTimer];
}

-(void)addSVTimer
{
    self.svTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollToNextView) userInfo:nil repeats:YES];
}

-(void)removeTimer
{
    [self.svTimer invalidate];
    self.svTimer = nil ;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self removeTimer];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.anniversaryScrollView removeFromSuperview];
    [self.anniversaryPageC removeFromSuperview];
    self.annNearlyDataArray = nil;
    self.scrollDataArray = nil;
    self.anniversaryScrollView = nil;
    self.anniversaryPageC = nil;
    
    [self.view addSubview:self.anniversaryScrollView];
    [self.view addSubview:self.anniversaryPageC];
    [self.anniversaryNearlyTableView reloadData];
    
    [self removeTimer];
    [self addSVTimer];
}

@end
