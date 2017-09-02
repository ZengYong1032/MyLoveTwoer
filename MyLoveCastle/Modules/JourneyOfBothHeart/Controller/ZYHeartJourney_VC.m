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

@property (nonatomic,strong) NSArray *logsArray;

@end

@implementation ZYHeartJourney_VC

-(NSArray *)logsArray
{
    if (!_logsArray)
    {
        _logsArray = [self addLogsData];
    }
    return _logsArray;
}

-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary)
    {
        _dataDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@[@"Growth Ring",@"Dynamic"],@"SectionTitle",@[@[@"Luck Start",@"Luck Pause",@"To Renew"],@[@"最是人间留不住",@"朱颜辞镜花辞树"]],@"CellData", nil];
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
    NSInteger irow;
    
    if (indexPath.section == 1)
    {
        irow = indexPath.row + 3;
        
        ZYLogDetail_VC *ldvc = [ZYLogDetail_VC new];
        ldvc.theLogInfo = self.logsArray[irow];
        [self.navigationController pushViewController:ldvc animated:YES];
    }
    else
    {
        irow = indexPath.row;
        ZYLogList_VC *loglistVC = [ZYLogList_VC new];
        
        loglistVC.logsListDataArray = @[self.logsArray[0],self.logsArray[1],self.logsArray[2],self.logsArray[5]];
        [self.navigationController pushViewController:loglistVC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark ---- Add Log Data Method ----
-(NSMutableArray *)addLogsData
{
    NSArray *contentStrs = @[@[@"烟火的人间，背负了太多的无奈；四季的轮回，沉重了脚步的轻盈，余生与我，沾染了太多云雾的迷茫，我该拿你怎么样去给生命做一个交代呢？\n   -----题记\n",@"此生若能幸福安稳，谁又愿颠沛流离？此生若能遇良友知己，谁又愿孤影独怜。世间繁华，没有人愿意一生与孤独寂寞为伴;人海拥挤，却难以遇见知心之人。世间千红百媚，缘来缘去，我不知道我是谁的过客，谁又是我的归人。平淡的日子虽然隔着万水千山，却还是有那么多来自陌生人的关怀与帮助。天南地北的距离却阻隔不了有些心灵默契的契合，那一瞬的感动足以让我贫瘠的岁月生香，一生铭记。不用去问缘深缘浅，那本不是你我所能掌控的，顺其自然，活在当下，何必去在乎那未知的未来;也不用去管我们中间隔了几座山，几条河，那样的距离本不是你我所能跨越的，珍惜现在，是对彼此最好的安慰。但愿岁月深处再次想起，我们依旧怀有一颗感恩的心…"],@[@"相遇如花，谁为谁倾尽思念?只因在人群中那一眼的相惜，今生，思念的渡口，就算望穿秋水，我也会为你守候。\n",@"岁月薄凉，每个人都渴望一份灵魂的依托，渴望在阳光里行走，渴望在温暖里遇到那个对的，每天握着彼此的手微笑着穿过人群，欢乐在左，幸福在右，或是静坐庭院，无酒无花亦可笑看春山。\n",@"一个人走走停停，最怕寂寞相随，感谢你，在漫长的光阴中给我温暖，用一朵花开的时光，将最美的遇见，落入爱的诗行。人生是风景的辗转，有些人看过，便不忘，有些遇见，让红尘路上，再无飘泊，一份懂得，一份默契，只一眼，许一生相惜，那一抹牵念，在春花中灿烂，在秋水长天里发芽，让姹紫嫣红的四季里，有思念一直在生长."],@[@"一季风景，只因遇见你，你眼神里的幸福，是爱的味道，无论相隔多少春秋，最美的依旧是与你初见的模样.总是相信有些缘分是注定的，不然不会一见倾心，再见倾城，更不会有相见恨晚的真情流露。总想，为你书一笔眷恋，哪管山高水长，总想为你勾勒一幅绝美的画卷，哪管岁月悠长，今生，即便相隔天涯，有你也是暖。\n",@"这世间每一种的好，都只为懂他的人盛装而来，懂一个人，何须千言万语，只若珍惜，生命中有多少风景，我们错过了，仍在怀念，又要多少想念，是欲说还休的心疼?\n",@"一念起，跋山涉水，只为遇见，一念灭，沧海桑田，水流花谢，爱的渡口，等待的是一份默契，岁月的屋檐下，寻找一份相知，最深情的爱总是冷暖相依，最真挚的陪伴，是懂得和珍惜。"],@[@"我知道，你是懂我的，懂我月下的落寞，懂我孤独时的脆弱，懂我想你时的无助，懂我脚下的迷茫，爱是心疼，是内心深处的柔软。\n",@"总有那么一种思念，在午夜梦回时徘徊，总有一个身影，在梦里若隐若现，四目相对，已是万语千言。深深的喜欢，是在心里,浅浅的爱，是在眼里。最真的想念。是在梦里。喜欢一个人。是望穿秋水的等待，是千回百转的惦念。是众里寻他千百度，蓦然回首，你在灯火阑珊处的惆怅，是前世今生无悔的等待。\n",@"爱有多长，思念就有多远，纵然岁月深远，也是莫失莫忘，喜欢那种感觉，不浓不烈，不张不扬，只小心翼翼的收藏一份情意，听一首歌，念一段情，无论何时，想起你时，嘴角总会轻轻地上扬。"],@[@"真的好想，为你采一片叶，刻上你的名字,用一生一世珍藏，多想,安放一份执念,在似水流年里,和你共同谱一曲,时光静好,与君语;细水流年,与君同;繁华落尽,与君老。\n",@"阡陌红尘，能够将一个人轻轻安放在心中，寂然相爱，默然相守，于我，已然是一种幸福。一路走来，相依相伴，牵念，能望穿最深的流年，相守，能暖着岁月所有的薄凉，今生能够遇见你已是圆满，心深处，念你如昔。\n",@"一生很漫长，与你共渡便是梦想。就像你问我想去哪?我想说，有你的地方便是我要去的地方。有你在，春风像海浪一样。有你在，虫鸣就是美妙的回响。有你在，熟透的苹果映红你的脸庞。有你在，雪融晴朗。所以不用山川无尽，不用瀚海茫茫。只要有你，那便是良辰美景，你一回眸便灯火辉煌。"],@[@"有很多人都问我，异地恋真的有可能吗?其实我也不知道，但是我可以给你们讲讲我朋友的故事;在我们高中时期，阿芹是我们几个之间最没心没肺的一个，俗一点说就是百花丛中过，片叶不沾身那一类型，想这妮子说的，姐的人生还长，没事谁找男朋友管着咱。当时我们就笑她潇洒，谁也没想到真会有那么个眼睛瞎的和她走过一生。阿芹并不漂亮，但是健谈有人格魅力，当时我们班和隔壁班一起联合演出文艺节目，刚开始两个班的谁也不服谁，不想被压着，融合着特别困难;老师就让两个班的文娱自己看着办，阿芹是我们班的文娱，另一个就是浩子，那个陪她要走一生的人;这大概就是他们的相识相知，之后他俩人怎么陈仓暗度的，天知道，只是有次聚会上大家都喝高了，说起这事，大喊佩服浩子居然能把这滑不留手的泥鳅逮住，浩子特骄傲的说，那是，在第一次的时候很不服她，但后来被她的开朗豪爽吸引住，不作，这种女生哪找去，肯定得抓住不放啊。那阿芹怎么甘心被拴住啊，我很不解地问阿芹。阿芹笑的灿烂，这种骂不散打不走的人哪找去。之后想来还真是好女怕缠男啊。\n",@"高中的打闹之后面临的是分离，尽管阿芹为了和浩子在一个学校狠拼了半学期，也依然没改变他俩之间成绩的垮沟，浩子去了A省本科学校，阿芹留在H省读了职业技校，像这种分隔两地的恋情是很难修成正果的，也是不被很多人看好的，但是架不住浩子的不嫌弃，阿芹的坚持啊!一年到头也没有多少假期，但一有假期俩人是不怕风吹雨打也要见面。因为是闺蜜，我原本还担心阿芹会心里有什么压力，但看他们这腻歪劲儿，我真的有深深的想过我可能是想太多，就阿芹这没心没肺的可能知道伤感着两个字怎么写吗?之后几年阿芹也在努力考证，按照他们的计划，大概的意思就是想在今年工作定下来就结婚。但不管怎样，我还是很开心他们没有因为异地恋有什么波折，我不知道是不是所有的异地恋都有始无终，但我想那些借口异地分手的，只差了一份耐心，多了一些寂寞。一见钟情不一定长久，日久生情会让爱延续更长."]];
    
    NSMutableArray *loges = [NSMutableArray array];
    
    for (NSArray *theArray in contentStrs)
    {
        NSMutableAttributedString *ass = [[NSMutableAttributedString alloc] init];
        
        for (NSString *string in theArray)
        {
            
           NSMutableAttributedString *as = [ZYConvertTool stringConvertToAttributeString:string fontSize:20.0 kernSzie:1 tcolor:kCyanColor firstHeadIndent:30.0 isHaveunderLine:NO  isZapFont:NO];
                
            [ass appendAttributedString:as];
        }
        
        [loges addObject:ass];
    }
    
    NSArray *logTitles = @[@"醉在你眉间的笑意",@"人过三秋，才知四季",@"十年",@"最是人间留不住",@"朱颜辞镜花辞树",@"青梅枯萎，竹马老去"];
    NSArray *logDates = @[@"2017-01-16",@"2017-03-01",@"2017-05-20",@"2017-07-01",@"2017-08-31",@"2017-09-01"];
    NSArray *logNicks = @[@"落叶不喜秋",@"许嵩的小仙女迷妹",@"满脸欢颜深叹流年",@"落叶不喜秋",@"落叶不喜秋",@"落叶不喜秋"];
    NSArray *logHeadImgNames = @[@"o2.png",@"m1.png",@"m1.png",@"o2.png",@"o2.png",@"o2.png"];
    
    NSMutableArray *logs = [NSMutableArray array];
    
    for (int i=0; i<[loges count]; i++)
    {
        ZYLogInfo_Model *li = [ZYLogInfo_Model new];
        
        li.logTitle = logTitles[i];
        li.dateStr = logDates[i];
        li.nickStr = logNicks[i];
        li.headImgName = logHeadImgNames[i];
        li.contents = loges[i];
        
        [logs addObject:li];
    }
    
    
    return logs;
}

@end
