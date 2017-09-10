//
//  ZYChattingRecords_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/8/30.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYChattingRecords_VC.h"

@interface ZYChattingRecords_VC ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating,UISearchBarDelegate>

@property (nonatomic,strong) UITableView *secretTableView;
@property (nonatomic,strong) UISearchController *secretSearchC;

@property (nonatomic,strong) NSArray *secretsArray;
@property (nonatomic,strong) NSArray *results;

@end

@implementation ZYChattingRecords_VC

-(NSArray *)results
{
    if (!_results)
    {
        _results = [NSArray arrayWithArray:GetBundleDictionaryFile(@"Secrets", @"plist")[@"SecretData"]];
    }
    return _results;
}

-(UITableView *)secretTableView
{
    if (!_secretTableView)
    {
        _secretTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50.0) style:UITableViewStyleGrouped];
        _secretTableView.delegate = self;
        _secretTableView.dataSource = self;
        _secretTableView.tableHeaderView = self.secretSearchC.searchBar;
    }
    return _secretTableView;
}

-(UISearchController *)secretSearchC
{
    if (!_secretSearchC)
    {
        _secretSearchC = [[UISearchController alloc] initWithSearchResultsController:nil];
        _secretSearchC.searchResultsUpdater = self;
        _secretSearchC.dimsBackgroundDuringPresentation = NO;
        _secretSearchC.searchBar.delegate = self;
    }
    return _secretSearchC;
}

-(NSArray *)secretsArray
{
    if (!_secretsArray)
    {
        _secretsArray = [NSArray arrayWithArray:GetBundleDictionaryFile(@"Secrets", @"plist")[@"SecretData"]];
    }
    return _secretsArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    [self.view addSubview:self.secretTableView];
}

#pragma mark ---- UITable View Data Source & Delegate Methods ----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.secretSearchC.active ? [self.secretsArray count] : [self.results count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.secretSearchC.active ? [self.secretsArray[section][@"secrets"] count] : [self.results[section][@"secrets"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecretCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SecretCell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell.detailTextLabel setTextAlignment:NSTextAlignmentRight];
    }
    
    [cell.textLabel setText:NSStringFormat(@"%@",self.secretSearchC.active ? self.secretsArray[indexPath.section][@"secrets"][indexPath.row][@"dateStr"]:self.results[indexPath.section][@"secrets"][indexPath.row][@"dateStr"])];
    NSMutableAttributedString *as = [[NSMutableAttributedString alloc] initWithString:NSStringFormat(@"%ld",self.secretSearchC.active ? [self.secretsArray[indexPath.section][@"secrets"] count]:[self.results[indexPath.section][@"secrets"] count]) attributes:@{NSFontAttributeName:SYSTEMFONT(14)}];
    NSAttributedString *pic = [[NSAttributedString alloc] initWithString:NSStringFormat(@"  pieces") attributes:@{NSFontAttributeName:SYSTEMFONT(12)}];
    [as appendAttributedString:pic];
    [cell.detailTextLabel setAttributedText:as];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.secretSearchC.active ? self.secretsArray[section][@"dateStr"]:self.results[section][@"dateStr"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.secretSearchC.active)
    {
        [self.secretSearchC dismissViewControllerAnimated:NO completion:nil];
    }
    ZYSecretDetail_VC *sdvc = [ZYSecretDetail_VC new];
    sdvc.secretsDataArray = self.secretsArray[indexPath.section][@"secrets"][indexPath.row][@"chats"];
    sdvc.title = self.secretSearchC.active ? self.secretsArray[indexPath.section][@"secrets"][indexPath.row][@"dateStr"]:self.results[indexPath.section][@"secrets"][indexPath.row][@"dateStr"];
    
    [self.navigationController pushViewController:sdvc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark ---- UISearch Results Updating Methods ----
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    self.secretsArray = nil;
    self.secretsArray = [self findContactsByName:searchString];
    [self.secretTableView reloadData];
}

-(NSArray *)findContactsByName:(NSString *)searchName
{
//    NSPredicate *predicates = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",[ZYStringTool removeSpaceFromString:searchName]];
    NSString *searchStr = [ZYStringTool removeSpaceFromString:searchName];

    NSMutableArray *results = [NSMutableArray array];
    
    
    for (NSDictionary *nd in self.results)
    {
        NSMutableDictionary *mnd = [NSMutableDictionary dictionary];

        if ([[ZYStringTool removeSpaceFromString:nd[@"dateStr"]] containsString:searchStr])
        {
            [mnd setObject:nd[@"dateStr"] forKey:@"dateStr"];
            [mnd setObject:nd[@"secrets"] forKey:@"secrets"];
            [results addObject:mnd];
        }
        else
        {
            NSMutableArray *secretsA = [NSMutableArray array];
            
            for (NSDictionary *dic in nd[@"secrets"])
            {
                NSMutableDictionary *secretsDic = [NSMutableDictionary dictionary];
                
                if ([[ZYStringTool removeSpaceFromString:dic[@"dateStr"]]containsString:searchStr])
                {
                    [secretsA addObject:dic];
                    [mnd setObject:nd[@"dateStr"] forKey:@"dateStr"];
                    [mnd setObject:secretsA forKey:@"secrets"];
                    [results addObject:mnd];
                }
                else
                {
                    NSMutableArray *chatsArray = [NSMutableArray array];
                    
                    for (NSDictionary *chatDic in dic[@"chats"])
                    {
                        if ([[ZYStringTool removeSpaceFromString:chatDic[@"dateStr"]] containsString:searchStr])
                        {
                            [chatsArray addObject:chatDic];
                            [secretsDic setObject:dic[@"dateStr"] forKey:@"dateStr"];
                            [secretsDic setObject:chatsArray forKey:@"chats"];
                            [secretsA addObject:secretsDic];
                            
                            [mnd setObject:nd[@"dateStr"] forKey:@"dateStr"];
                            [mnd setObject:secretsA forKey:@"secrets"];
                            [results addObject:mnd];
                        }
                    }
                }
            }
        }
    }
    return results;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willDismissSearchController:(UISearchController *)searchController
{
    self.secretsArray = nil;
    [self.secretTableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.secretSearchC.searchBar.text = @"";
    [self.secretSearchC resignFirstResponder];
    self.secretSearchC.searchBar.showsCancelButton = NO;
    self.secretsArray = nil;
    [self.secretTableView reloadData];
}

@end
