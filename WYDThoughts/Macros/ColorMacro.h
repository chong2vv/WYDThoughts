//
//  ColorMacro.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#ifndef ColorMacro_h
#define ColorMacro_h

#pragma mark - UIColor宏定义

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#pragma mark - Color 色值定义
#define textColorGray UIColorFromRGBA(0x898989, 1.0)


#endif /* ColorMacro_h */
