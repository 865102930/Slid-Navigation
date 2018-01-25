//
//  AFNetWorkingRequestManager.m
//  PractiseDemo
//
//  Created by gz on 2018/1/24.
//  Copyright © 2018年 gz. All rights reserved.
//

#import "AFNetWorkingRequestManager.h"
#import <AFNetworking.h>

@interface AFNetWorkingRequestManager ()
/// manager
@property (nonatomic, strong) AFHTTPSessionManager*sessionManager;
@end

@implementation AFNetWorkingRequestManager

+ (AFNetWorkingRequestManager *)shareManager {
    static AFNetWorkingRequestManager *requestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requestManager = [[AFNetWorkingRequestManager alloc] init];
    });
    return requestManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.sessionManager.requestSerializer.timeoutInterval = 30;
        self.sessionManager.securityPolicy.allowInvalidCertificates = YES;
        self.sessionManager.securityPolicy.validatesDomainName = NO;
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"application/xml",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
        
    }
    return self;
}

#pragma mark ========== 数据请求封装类 ==========
- (void)GETRequestWithURL:(NSString *)url param:(NSDictionary *)param progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed {
    [self.sessionManager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

- (void)GETRequestWithURL:(NSString *)url param:(NSDictionary *)param success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed {
    [self.sessionManager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

- (void)POSTRequestWithURL:(NSString *)url param:(NSDictionary *)param progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed {
    [self.sessionManager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

- (void)POSTRequestWithURL:(NSString *)url param:(NSDictionary *)param success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed {
    [self.sessionManager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}

// 取消数据请求
- (void)cancleTask {
    [self.sessionManager.operationQueue cancelAllOperations];
}

@end
