//
//  HomeTableViewCellViewModel.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeTableViewCellViewModel : NSObject

@property (nonatomic, strong) UIImage *picImage;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;

@end
