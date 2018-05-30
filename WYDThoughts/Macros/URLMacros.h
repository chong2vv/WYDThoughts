//
//  URLMacros.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h
//内部版本号
#define VersionCode 1

#define DevelopHost    1
#define ProductHost    0

#if DevelopHost

/**开发服务器*/
#define Base_Url @"http://47.104.20.193:18188"

#elif ProductHost

/**生产服务器*/
#define Base_Url @"http://47.104.20.193:18188"
#endif

#endif /* URLMacros_h */
