//
//  UIViewController+BaseViewController.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 最开始一直是用集成的方式来做为基类，但是后来项目迭代后发现当有一次必须要和其他业务部门合并代码的时候，直接继承的baseVC的情况下简直哔了狗了。所以之后设计的时候，就直接用黑魔法，不做集成类，而是直接作为类目通过runtime来设计。
 */
@interface UIViewController (BaseViewController)

@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

- (void)initNavBarTitle:(NSString *)title backAction:(SEL )backAction;
@end
