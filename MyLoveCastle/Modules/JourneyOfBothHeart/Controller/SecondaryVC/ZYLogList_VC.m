//
//  ZYLogList_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/2.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYLogList_VC.h"

@interface ZYLogList_VC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *logsListTableView;
@property (nonatomic,strong) UISegmentedControl *typeSegmentedControl;

@end

@implementation ZYLogList_VC

-(UITableView *)logsListTableView
{
    if (!_logsListTableView)
    {
        _logsListTableView = [[UITableView alloc] initWithFrame:kScreen_Bounds style:UITableViewStylePlain];
        _logsListTableView.delegate = self;
        _logsListTableView.dataSource = self;
    }
    return _logsListTableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    self.title = @"Logs List";
    
    [self.view addSubview:self.logsListTableView];
}

#pragma mark ---- UITable View Data Source & Delegate Methods ----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.logsListDataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ListCell"];
    }
    
    [cell.textLabel setText:((ZYLogInfo_Model *)self.logsListDataArray[indexPath.row]).logTitle];
    [cell.detailTextLabel setText:((ZYLogInfo_Model *)self.logsListDataArray[indexPath.row]).dateStr];
    [cell.detailTextLabel setTextColor:kGray2Color];
    [cell.detailTextLabel setTextAlignment:NSTextAlignmentRight];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYLogDetail_VC *ldvc = [ZYLogDetail_VC new];
    ldvc.theLogInfo = self.logsListDataArray[indexPath.row];
    [self.navigationController pushViewController:ldvc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
