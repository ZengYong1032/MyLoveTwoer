//
//  ZYSecretDetail_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/4.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYSecretDetail_VC.h"

@interface ZYSecretDetail_VC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *secretTableView;

@end

@implementation ZYSecretDetail_VC

-(UITableView *)secretTableView
{
    if (!_secretTableView)
    {
        _secretTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNormSpace, kScreenWidth, kScreen_Y(0.9)) style:UITableViewStyleGrouped];
        _secretTableView.delegate = self;
        _secretTableView.dataSource = self;
        _secretTableView.sectionFooterHeight = 0;
        _secretTableView.sectionHeaderHeight = 20.0;
        _secretTableView.userInteractionEnabled = NO;
        [_secretTableView registerNib:[UINib nibWithNibName:@"ZYSecretCell_Model" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SecretLeftCell"];
        [_secretTableView registerNib:[UINib nibWithNibName:@"ZYSecretRightCell_Model" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SecretRightCell"];
    }
    return _secretTableView;
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
    return [self.secretsDataArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *secretDic = self.secretsDataArray[indexPath.section];
    NSString *iDType = NSStringFormat(@"%@",(NSNumber *)secretDic[@"iDType"]);
    
    if ([iDType isEqualToString:@"0"])
    {
        ZYSecretCell_Model *cell = [tableView dequeueReusableCellWithIdentifier:@"SecretLeftCell"];
        
        if (!cell)
        {
            cell = [ZYSecretCell_Model new];
            [cell setRestorationIdentifier:@"SecretLeftCell"];
        }
        
        [cell.messageLab setText:secretDic[@"contents"]];
        [cell.headImgView setImage:[UIImage imageNamed:secretDic[@"headImgName"]]];
        
        return cell;
    }
    else
    {
        ZYSecretRightCell_Model *cell = [tableView dequeueReusableCellWithIdentifier:@"SecretRightCell"];
        
        if (!cell)
        {
            cell = [ZYSecretRightCell_Model new];
            [cell setRestorationIdentifier:@"SecretRightCell"];
        }
        
        [cell.messageLab setText:secretDic[@"contents"]];
        [cell.headImgView setImage:[UIImage imageNamed:secretDic[@"headImgName"]]];
        
        return cell;
    }
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
