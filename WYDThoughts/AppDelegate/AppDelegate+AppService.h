//
//  AppDelegate+AppService.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "AppDelegate.h"

@class CYLTabBarController;
/**
    App的相关第三方注册单独拎出来，这样一方面方便查找，另一方面避免入口代码冗余过多
 */
@interface AppDelegate (AppService)

//初始化Window
- (void)initWindow;
//初始化使用的第三方SDK
- (void)initSDK;
//初始化用户登录
- (BOOL)initLogin;
//设置rootVC
- (void)initRootViewController;
@end
