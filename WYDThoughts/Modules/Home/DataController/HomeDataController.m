//
//  HomeDataController.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "HomeDataController.h"
#import "NetWorkManager.h"
#import "JoinModel.h"
#import "NSObject+BaseModel.h"
#import "HomeUrl.h"

@implementation HomeDataController

- (void)requestGoodsDataWithCallback:(CompletionCallback)callback
{
    [[NetWorkManager NetWorker] POST:app_home parameters:nil success:^(id responseData, NSURLSessionDataTask *task) {
        NSDictionary *dic = (NSDictionary *) responseData;
        NSLog(@"%@",dic);
        
        
    } failure:^(NSString *errorString, NSURLSessionDataTask *task) {
        
    }];
}

@end
