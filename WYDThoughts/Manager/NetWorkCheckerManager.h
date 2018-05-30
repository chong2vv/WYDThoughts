//
//  NetWorkCheckerManager.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface NetWorkCheckerManager : NSObject

//获取NetworkerChecker单例
+ (instancetype)checker;

//网路是否可用
-(BOOL)isNetworkBroken;

// 获取当前网络状态
-(NetworkStatus)getNetworkStatus;

//获取当前网络状态 并获得相应回调
-(NetworkStatus)checkNetworkStatusOnNotReachable:(void (^)(void))onNotReachable
                              onReachableViaWWAN:(void (^)(void))onReachableViaWWAN
                              onReachableViaWiFi:(void (^)(void))onReachableViaWiFi;

//监听网络状态改变
@property (nonatomic, copy) void (^networkChanged)(NetworkStatus);

@end
