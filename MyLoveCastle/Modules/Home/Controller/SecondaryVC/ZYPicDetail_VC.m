//
//  ZYPicDetail_VC.m
//  MyLoveCastle
//
//  Created by ZyZl on 2017/9/1.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#import "ZYPicDetail_VC.h"

#define kItemWidth 100.0
#define kitemHeight 121.0

@interface ZYPicDetail_VC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *picCollectionView;
@property (nonatomic,strong) NSArray *picsArray;

@end

@implementation ZYPicDetail_VC

-(UICollectionView *)picCollectionView
{
    if (!_picCollectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        [layout setItemSize:CGSizeMake(kItemWidth, kitemHeight)];
        
        _picCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNormSpace, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        _picCollectionView.delegate = self;
        _picCollectionView.dataSource = self;
        [_picCollectionView setBackgroundColor:kWhiteColor];
//        _picCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, kScreen_X(1.5));
        [_picCollectionView setContentSize:CGSizeMake(kScreen_X(2.0), kScreenHeight - 10.0)];
        _picCollectionView.scrollEnabled = YES;
        [_picCollectionView registerNib:[UINib nibWithNibName:@"ZYPicCollectionViewCell_Model" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"PicCollectionViewCell"];
    }
    return _picCollectionView;
}

-(NSArray *)picsArray
{
    if (!_picsArray)
    {
        _picsArray = [NSArray arrayWithArray:[self getData]];
    }
    return _picsArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    [super setup];
    
    self.title = @"Pic Detail";
    
    [self.view addSubview:self.picCollectionView];
}

#pragma mark ---- UIColllection View Data Source & Delegate Methods ----
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.picsArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZYPicCollectionViewCell_Model *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PicCollectionViewCell" forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[ZYPicCollectionViewCell_Model alloc] initWithPicName:((ZYPicDetail_Model *)self.picsArray[indexPath.row]).picName picTitle:((ZYPicDetail_Model *)self.picsArray[indexPath.row]).picTitle identiferString:@"PicCollectionViewCell"];
    }
    
    [cell setPicTitle:((ZYPicDetail_Model *)self.picsArray[indexPath.row]).picTitle];
    [cell setPicName:((ZYPicDetail_Model *)self.picsArray[indexPath.row]).picName];
    

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZYPicInfo_VC *infovc = [ZYPicInfo_VC new];
    infovc.picInfo = (ZYPicDetail_Model *)self.picsArray[indexPath.row];
    [self.navigationController pushViewController:infovc animated:YES];
}

-(NSMutableArray *)getData
{
    NSMutableArray *pics = [NSMutableArray array];
    NSArray *a = @[@[@"Cute",@"2017_08_25",@"im0",@"四川成都",@"我也曾见过她爱一个人，为爱抛却了羞涩，奋不顾身。"],@[@"Beautiful",@"2017_07_26",@"im1",@"四川成都",@"也曾似少女般转发些对方看不见的情话与祈求，为对方的话忧心忡忡彻夜不眠。"],@[@"Pretty",@"2017_06_27",@"im2",@"四川泸州",@"像极了我爱她的姿态。这时我才明白，她爱一个人的真正模样."],@[@"Cool",@"2017_05_28",@"m0",@"四川资阳",@"待你白发苍苍，容颜迟暮，我定会，依旧如此，执你之手，倾一世温情。"],@[@"Grim",@"2017_04_29",@"m1",@"四川乐山",@"初识不知曲中意，再听已是曲中人。繁华尽处，觅一处无人山谷，建一木制小屋，铺一青石小路，与你晨钟暮鼓，安之若素。"],@[@"Hot",@"2017_03_30",@"m2",@"四川雅安",@"想你的时候有些幸福，幸福得有些难过。"],@[@"Fickle",@"2017_01_31",@"o0",@"四川成都温江",@"这个冬天没能给我惊喜。。。"],@[@"Beauty",@"2016_03_31",@"o4",@"四川成都天府新区",@"回望灯如旧，浅握双手。"],@[@"Soft",@"2016_02_21",@"o3",@"四川成都高新区",@"忘记开心的，就不会不开心了。"],@[@"Clever",@"2016_05_11",@"o5",@"四川成都龙泉驿区",@"我在过马路，你人在哪里？"],@[@"Gentle",@"2016_09_01",@"o1",@"四川成都武侯区",@"青梅枯萎，竹马老去，从此我爱的人都想你。"]];
    for (NSArray *theArray in a)
    {
        NSDictionary *dic = @{@"picTitle":theArray[0],@"picDate":theArray[1],@"picName":theArray[2],@"picAddress":theArray[3],@"picDescription":theArray[4]};
        ZYPicDetail_Model *pd = [ZYPicDetail_Model new];
        [pd setValuesForKeysWithDictionary:dic];
        
        [pics addObject:pd];
    }
    
    return pics;
    
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
