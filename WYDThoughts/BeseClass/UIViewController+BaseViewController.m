//
//  UIViewController+BaseViewController.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "UIViewController+BaseViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (BaseViewController)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换自定义的viewDidLoad
        Method viewDidload = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
        Method viewDidloaded = class_getInstanceMethod([UIViewController class], @selector(viewDidLoaded));
        method_exchangeImplementations(viewDidload, viewDidloaded);
    });
}

// 相当于重写viewDidLoad，但是又不丧失系统原有功能，同时可作为支撑扩展。 至于想不使用当前方法的话，单独页面做自定义方法重写即可。
- (void)viewDidLoaded{
    [self viewDidLoaded];
    self.view.backgroundColor = [UIColor redColor];
}

//增加自定义navbar
- (void)initNavBarTitle:(NSString *)title backAction:(SEL )backAction
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    
    if(backAction != nil) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0.0, 0.0, 43.0/2, 48.0/2);
        [backButton setImage:[UIImage imageNamed:@"umeng_fb_back_selected"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"umeng_fb_back_normal"] forState:UIControlStateSelected];
        [backButton setImage:[UIImage imageNamed:@"umeng_fb_back_normal"] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:backAction forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    }
    else {
        self.navigationItem.hidesBackButton = YES;
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    label.text = title;
    [label sizeToFit];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
#pragma clang diagnostic pop
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

@end
