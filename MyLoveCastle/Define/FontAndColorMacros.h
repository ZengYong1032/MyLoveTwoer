//
//  FontAndColorMacros.h
//  ShellFrame
//
//  Created by ZyZl on 2017/6/7.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

//字体
#define BOLDSYSTEMFONt(fONtSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME,FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//颜色
#define kClearColor [UIColor clearColor] //clear
#define kWhiteColor [UIColor whiteColor] //white
#define kBlackColor [UIColor blackColor] //black
#define kGrayColor [UIColor grayColor]   //gray
#define kCyanColor [UIColor cyanColor]   //cyan
#define kOrangeColor [UIColor orangeColor]    //orange
#define kGray2Color [UIColor lightGrayColor]  //lightGray
#define kGreenColor [UIColor greenColor]      //green
#define kBlueColor [UIColor blueColor]        //blue
#define kRedColor [UIColor redColor]          //red
#define kYellowColor [UIColor yellowColor]    //yellow
#define kMagentaColor [UIColor magentaColor]  //magenta
#define kPurpleColor [UIColor purpleColor]    //purple
#define kBrownColor [UIColor brownColor]      //brown
#define kBorderColor kGray2Color
#define kTabBarTitleColor kCustomColor(243, 161, 239, 1.0)
#define kCustomGrayColor(WHITE,ALPHA) [[UIColor alloc] initWithWhite:WHITE alpha:ALPHA]
#define kCustomColor(RED,GREEN,BLUE,ALPHA) [UIColor colorWithRed:(RED/255.f) green:(GREEN/255.f) blue:(BLUE/255.f) alpha:(ALPHA)]
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256.0)/255.0 blue:arc4random_uniform(256.0)/255.0 alpha:arc4random_uniform(256.0)/255.0]//随机色

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//角度
#define th M_PI/180

#endif /* FontAndColorMacros_h */
