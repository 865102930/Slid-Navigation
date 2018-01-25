//
//  AFNetWorkingRequestManager.h
//  PractiseDemo
//
//  Created by gz on 2018/1/24.
//  Copyright © 2018年 gz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetWorkingRequestManager : NSObject

+ (AFNetWorkingRequestManager *)shareManager;

/**
 带进度条的GET请求
 
 @param url     URL
 @param param   参数
 @param success 成功回调
 @param failed  失败回调
 */
- (void)GETRequestWithURL:(NSString *)url param:(NSDictionary *)param progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;

/**
 不带进度条的GET请求
 
 @param url     URL
 @param param   参数
 @param success 成功回调
 @param failed  失败回调
 */
- (void)GETRequestWithURL:(NSString *)url param:(NSDictionary *)param success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;

/**
 带进度条的POST请求
 
 @param url     URL
 @param param   参数
 @param success 成功回调
 @param failed  失败回调
 */
- (void)POSTRequestWithURL:(NSString *)url param:(NSDictionary *)param progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;


/**
 不带进度条的POST请求

 @param url     URL
 @param param   参数
 @param success 成功回调
 @param failed  失败回调
 */
- (void)POSTRequestWithURL:(NSString *)url param:(NSDictionary *)param success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;


/**
 取消数据请求
 */
- (void)cancleTask;

@end
