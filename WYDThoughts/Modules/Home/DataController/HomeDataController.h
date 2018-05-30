//
//  HomeDataController.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionCallback)(NSArray *object);

@interface HomeDataController : NSObject

@property (nonatomic, strong, readonly) NSArray *goods;

- (void)requestGoodsDataWithCallback:(CompletionCallback)callback;

@end
