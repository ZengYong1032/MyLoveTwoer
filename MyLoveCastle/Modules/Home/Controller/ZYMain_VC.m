//
//  ZYMain_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYMain_VC.h"

@interface ZYMain_VC ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myPretyTimeTableView;
@property (nonatomic,strong) NSMutableArray *sectionTitlesArray;
@property (nonatomic,strong) NSMutableArray *picNamesArray;

@end

@implementation ZYMain_VC

-(UITableView *)myPretyTimeTableView
{
    if (!_myPretyTimeTableView)
    {
        _myPretyTimeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreen_Y(0.9) + 20.0) style:UITableViewStyleGrouped];
        _myPretyTimeTableView.delegate = self;
        _myPretyTimeTableView.dataSource = self;
        _myPretyTimeTableView.rowHeight = 56.0;
        _myPretyTimeTableView.sectionFooterHeight = 0;
        _myPretyTimeTableView.sectionHeaderHeight = 26.0;
        [_myPretyTimeTableView registerNib:[UINib nibWithNibName:@"ZYPrettyTimeImg_Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PrettyTimeCell"];
        _myPretyTimeTableView.tableHeaderView = [ZYPretyTimeHeadView_Model createPretyTimeHeadViewWithTarget:self frame:CGRectMake(0, 0, kScreenWidth, 184.0) headshots:@[@"o2.png",@"m1.png"] content:@"我也曾见过她爱一个人，为爱抛却羞涩，奋不顾身。也曾似少女般转发些对方看不见的情话和诉求。为对方的话忧心忡忡，彻夜不眠。像极了我爱她的姿态，这时我才明白她爱一个人的真正模样。"];
    }
    return _myPretyTimeTableView;
}

-(NSMutableArray *)sectionTitlesArray
{
    if (!_sectionTitlesArray)
    {
        _sectionTitlesArray = [NSMutableArray arrayWithObjects:@"Morn_Pic",@"Impromptu_Pic",@"Other_Pic", nil];
    }
    return _sectionTitlesArray;
}

-(NSMutableArray *)picNamesArray
{
    if (!_picNamesArray)
    {
        _picNamesArray = [NSMutableArray arrayWithObjects:@[@[@"m0.png",@"m1.png",@"m2.png",@""]],@[@[@"im0.png",@"im1.png",@"im2.png",@""]],@[@[@"o0.png",@"o1.png",@"o4.png",@"o3.png"]], nil];
    }
    return _picNamesArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    [self.view addSubview:self.myPretyTimeTableView];
}

#pragma mark ---- UITable View Delegate & Data Source Methods ----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.picNamesArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.picNamesArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYPrettyTimeImg_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrettyTimeCell"];
    
    if (!cell)
    {
        cell = [[ZYPrettyTimeImg_Cell alloc] initCellWithFirstName:self.picNamesArray[indexPath.section][indexPath.row][0] secondName:self.picNamesArray[indexPath.section][indexPath.row][1] thirdName:self.picNamesArray[indexPath.section][indexPath.row][2] fourthName:self.picNamesArray[indexPath.section][indexPath.row][3] identifierString:@"PrettyTimeCell"];
    }
    
    [cell.firstImg setImage:[UIImage imageNamed:self.picNamesArray[indexPath.section][indexPath.row][0]]];
    [cell.secondImg setImage:[UIImage imageNamed:self.picNamesArray[indexPath.section][indexPath.row][1]]];
    [cell.thirdImg setImage:[UIImage imageNamed:self.picNamesArray[indexPath.section][indexPath.row][2]]];
    [cell.fourthImg setImage:[UIImage imageNamed:self.picNamesArray[indexPath.section][indexPath.row][3]]];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 26.0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitlesArray[section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.navigationController pushViewController:[ZYPicDetail_VC new] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
