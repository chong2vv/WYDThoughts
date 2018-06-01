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
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:@"北京市" forKey:@"city"];
    [[NetWorkManager NetWorker] POST:app_home parameters:dic success:^(id responseData, NSURLSessionDataTask *task) {
        NSDictionary *dic = (NSDictionary *) responseData;
        NSLog(@"%@",dic);
        NSArray *jsonArray = [dic objectForKey:@"result"];
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger i = 0; i < jsonArray.count; i++) {
            NSDictionary *json = [jsonArray objectAtIndex:i];
            JoinModel *model = [[JoinModel alloc] init];
            [model parseJsonData:json];
            [modelArray addObject:model];
        }
        
        callback(modelArray,nil);
        
    } failure:^(NSString *errorString, NSURLSessionDataTask *task) {
//        callback(nil,)
    }];
}

@end
