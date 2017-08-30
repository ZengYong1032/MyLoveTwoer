//
//  UtilsMacros.h
//  ShellFrame
//
//  Created by ZyZl on 2017/6/7.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//获取系统对象
#define kApplication [UIApplication sharedApplication]
#define kAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kAppWindow [UIApplication sharedApplication].delegate.window
#define kRootViewController [UIApplication sharedAppication].delegate.window.rootViewController
#define kUserDefaults [UIApplication standarUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kFileManager [NSFileManager defaultManager]

//获取屏幕宽高
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScreenCenter kScreenWidth * 0.5
#define kScreen_X(scale) (kScreenWidth * scale)
#define kScreen_Y(scale) (kScreenHeight * scale)

#define Iphone6ScaleWidth kScreenWidth / 375.0
#define Iphone6ScaleHeight kScreenHeight / 667.0

//获取系统版本
#define IOSAVAILABLeverSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]

//常见标准控件尺寸属性
#define kStatusBarHeight 30.0
#define kNormSpace 10.0
#define kBackButtonWidth 40.0
#define kBackButtonHeight 30.0
#define kButtonBorderWidth 0.5
#define kSmallSpace 4.0
#define kStandardSpace 8.0
#define kButtonCorneRadius 5.0

//当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//
#define SuppressPerformSelectorLeakWarning(Stuff)\
do{\
    _Pragma("clang diagnostic push")\
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
    Stuff;\
    _Pragma("clang diagnostic pop")\
} while (0)

//Quick convert String Or UTF8String
#define kConvertStringWithChar(charStr) [NSString stringWithUTF8String:charStr]
#define kConvertUTF8StringWithString(str) [str UTF8String]

//Quick convert String Or SEL
#define kConvertStringWithSel(sel) NSStringFromSelector(sel)
#define kConvertSelWithString(name) NSSelectorFromString(name)

//get data from NSBundle
#define GetBundleArrayFile(filename,filetype) ([[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:filetype]])
#define GetBundleDictionaryFile(filename,filetype) ([[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:filetype]])

//get Space value
#define GetSpaceValue(width,count,x) ((kScreenWidth - 2 * x - width * count)/(count - 1))
#define kStatusBarHeight 30.0
#define kNormSpace 10.0

//Quick Statement
#define PropertyString(s) @property (nonatomic,strong) NSString * s
#define PropertyNSInteger(s) @property (nonatomic,assign) NSInteger s
#define PropertyFloat(s) @property (nonatomic,assign) float s
#define PropertyLongLont(s) @property (nonatomic,assign) long long s
#define  PropertyNSDictionary(s) @property (nonatomic,strong) NSDictionary * s
#define PropertyNSArray(s) @property (nonatomic,strong) NSArray * s
#define PropertyNSMutableArray(s) @property (nonatomic,strong) NSMutableArray * s
#define PropertyNSMutableDictionary(s) @property (nonatomic,strong) NSMutableDictionary * s

//Data Verification
#define StrValid(f) (f !=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f)?f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)
#define ValidDict(f) (f!=nil &&[f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil &&[f isKindOfClass:[NSArray class]]&&[f count]>0)
#define ValidNum(f) (f!=nil &&[f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil &&[f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil &&[f isKindOfClass:[NSData class]])

//Print Current Method Name
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s",__PRETTY_FUNCTION__)

//GCD
#define kDISPATCH_ASYNC_BLOCK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),block)

#define kDISPATCH_MAIN_BLOCK(block) dispatch_async(dispatch_get_main_queue(),block)

//GCD 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) (static dispatch_once_t onceToken;dispatch_once(&onceToken,onceBlock);)
//单例化一个类
#define SINGLETON_FOR_HEADER(className)\
\
+(className *)shared##className;

#define SINGLETON_FOR_CLASS(className)\
\
+(className *)shared##className { \
static className *shared##className = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{ \
shared##className =[[self alloc]init];\
});\
return shared##className;\
}

//弱引用/强引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;

//custom log
#ifdef DEBUG
#define kLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define kLog(...)
#endif

#define kOpenSQLiteFailed kLog(@"------------------SQLite open failed.-----------------")
#define kInsertSQLiteFailed kLog(@"------------------SQLite insert failed.-----------------")

//config view radius
#define kViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// Degrees or Radian
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#endif /* UtilsMacros_h */


