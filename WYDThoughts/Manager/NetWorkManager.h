//
//  NetWorkManager.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionBlock)(id responseData, NSURLSessionDataTask *task);
typedef void(^FailureBlock)(NSString *errorString, NSURLSessionDataTask *task);

@interface NetWorkManager : NSObject

+ (instancetype)NetWorker;

/**
 *  POST 方法
 *
 *  @param urlString  请求的服务端的地址
 *  @param parameters  参数
 *  @param success  请求成功返回
 *  @param failure  请求失败返回
 *
 */
- (void)POST:(NSString *)urlString
  parameters:(id)parameters
     success:(CompletionBlock)success
     failure:(FailureBlock)failure;

/**
 *  GET方法请求数据
 *
 *  @param urlString  请求的服务端的地址
 *  @param parameters  参数
 *  @param success  请求成功返回
 *  @param failure  请求失败返回
 */
- (void)GET:(NSString *)urlString
 parameters:(id)parameters
    success:(CompletionBlock)success
    failure:(FailureBlock)failure;



@end
