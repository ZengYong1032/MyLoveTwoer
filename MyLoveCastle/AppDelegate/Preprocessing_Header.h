//
//  Preprocessing_Header.h
//  ControlsTest
//
//  Created by ZyZl on 2017/7/3.
//  Copyright © 2017年 ZyZl. All rights reserved.
//

#ifndef Preprocessing_Header_h
#define Preprocessing_Header_h

#define SYSTEMCONFIG_NAME @"Config.archive"
#define CONFIG_KEY @"PersistenceConfig"

//Base
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <sqlite3.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import <WebKit/WebKit.h>
#import "AppDelegate.h"
#import "AppDelegate+Service.h"
#import "AppDelegate_ZYService.h"
#import "UIViewController+ZYBasicSetting.h"

//Tool
#import "FontAndColorMacros.h"
#import "UtilsMacros.h"
#import "ZYCustomControls.h"
#import "ZYCustomIndicatorView.h"
#import "ZYConvertTool.h"
#import "ZYDataPersistenceTool.h"
#import "ZYRegisterTool.h"
#import "ZYStringTool.h"
#import "ZYViewTool.h"

//Model
#import "ZYTabBarViewsController.h"
#import "ZYBase_VC.h"
#import "ZYCustomBase_VC.h"
#import "ZYDataFilter.h"
#import "NSData+ZYImageData.h"

#endif /* Preprocessing_Header_h */
