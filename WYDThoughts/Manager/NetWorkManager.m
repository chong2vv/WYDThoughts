//
//  NetWorkManager.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/29.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworking.h"
#import "NetWorkCheckerManager.h"

@interface NetWorkManager ()

@property (nonatomic, readonly) AFHTTPSessionManager *sessionManager;

@end

@implementation NetWorkManager

+ (instancetype)NetWorker
{
    static dispatch_once_t once;
    static NetWorkManager *instance;
    dispatch_once(&once, ^ {
        instance = [[NetWorkManager alloc] init];
    });
    return instance;
}


- (instancetype)init{
    self = [super init];
    if (self){
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [_sessionManager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        _sessionManager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(100, 500)];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain", nil];
        _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        _sessionManager.securityPolicy.allowInvalidCertificates = YES;
        [_sessionManager.securityPolicy setValidatesDomainName:NO];
        
        //设置超时时间
        [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sessionManager.requestSerializer.timeoutInterval=10.f;
        [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    return self;
}

#pragma mark - POST Method
- (void)POST:(NSString *)urlString parameters:(id)parameters success:(CompletionBlock)success failure:(FailureBlock)failure
{
    if([[NetWorkCheckerManager checker] isNetworkBroken]) {
        if (failure) {
            failure(@"请求失败，请检查网络", nil);
        }
        return;
    }
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    [param addEntriesFromDictionary:parameters];
    
    [_sessionManager POST:[NSString stringWithFormat:@"%@",urlString] parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject){
            //
            NSDictionary *dic=responseObject;
            
            if (dic&&[dic isKindOfClass:[NSDictionary class]]) {
                if ([[responseObject allKeys]containsObject:@"error_code"]&&[[responseObject objectForKey:@"error_code"] integerValue] == 0) {
                    if (success) {
                        success(responseObject,nil);
                    }
                }else{
                    if (failure) {
                        failure(responseObject[@"error_msg"], nil);
                    }
                }
            }else{
                if (failure) {
                    failure(@"请求失败,请重试", nil);
                }
            }
        }else{
            if (failure) {
                failure(@"请求失败,请重试", nil);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(@"请求失败,请重试", nil);
        }
    }];
}

#pragma mark - GET Method

- (void)GET:(NSString *)urlString parameters:(id)parameters success:(CompletionBlock)success failure:(FailureBlock)failure
{
    if([[NetWorkCheckerManager checker] isNetworkBroken]) {
        if (failure) {
            failure(@"请求失败，请检查网络", nil);
        }
        return;
    }

    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    [param addEntriesFromDictionary:parameters];

    [_sessionManager GET:[NSString stringWithFormat:@"%@",urlString] parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject){
            //
            NSDictionary *dic=responseObject;
            
            if (dic&&[dic isKindOfClass:[NSDictionary class]]) {
                if ([[responseObject allKeys]containsObject:@"error_code"]&&[[responseObject objectForKey:@"error_code"] integerValue] == 0) {
                    if (success) {
                        success(responseObject,nil);
                    }
                }else{
                    if (failure) {
                        failure(responseObject[@"error_msg"], nil);
                    }
                }
            }else{
                if (failure) {
                    failure(@"请求失败,请重试", nil);
                }
            }
        }else{
            if (failure) {
                failure(@"请求失败,请重试", nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(@"请求失败,请重试", nil);
        }
    }];
}
@end
