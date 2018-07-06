//
//  MySDKNetWorking.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/7/4.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDKNetWorkController.h"
#import "MySDK.h"
#import "MySDKConfig.h"
#import "NSString+Sign.h"
//#import "KKDebug.h"
#import <MJExtension.h>

// 正式服 -- 最新2018.05.30开始使用
static NSString * const myBaseURLString = @"https://api.sdk.gzkaola.com";

/** 初始化 */
static NSString * const Init_URL = @"App/Basic/Init";

@interface MySDKNetWorkController()

@end

@implementation MySDKNetWorkController

#pragma mark - method

+ (instancetype)shareInstance {
    
    static MySDKNetWorkController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        instance = [super new];
        instance = [[self alloc]init];
    });
    return instance;
}

+(void)requestInitWithParam:(nullable id)param{
    
    DBLog(@"init，上传的参数：%@", param);
    [[MySDKNetWorkController new].manager POST:Init_URL parameters:param progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NetLog(@"init#网络请求,\n返回数据：%@",responseObject);
        //网络请求成功：告诉cp功能调用成功或者失败（失败原因有待详查）
//        [[MySDK shareInstance] delegateToCPWithType:[responseObject[@"result"] boolValue]?@"init":@"Fail" andParam:responseObject];
        //把网络请求成功结果返回给功能模块
        [[MySDKNetWorkController shareInstance] NetWorkRespondSuccessWithParam:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NetLog(@"\n#init#网络请求失败！请检查网络：%@",[error mj_keyValues]);
        //网络请求失败:告诉cp功能调用失败
//        [[MySDK shareInstance] delegateToCPWithType:@"Fail" andParam:[error mj_keyValues]];
        //把网络请求失败结果返回给功能模块
        [[MySDKNetWorkController shareInstance] NetWorkRespondFailWithParam:[error mj_keyValues]];
    }];
    
}







-(void)NetWorkRespondSuccessWithParam:(NSDictionary*)param{
    if ([self.delegate respondsToSelector:@selector(NetWorkRespondSuccessDelegate:)]) {
        [self.delegate NetWorkRespondSuccessDelegate:param];
    }
}

-(void)NetWorkRespondFailWithParam:(NSDictionary*)param{
    if ([self.delegate respondsToSelector:@selector(NetWorkRespondFailDelegate:)]) {
        [self.delegate NetWorkRespondFailDelegate:param];
    }
}


#pragma mark - Getter & Setter
- (AFHTTPSessionManager *)manager {
    
    if (_manager) {
        return _manager;
    }
    
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:myBaseURLString]];
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    _manager.requestSerializer.timeoutInterval = 30.f;
    return _manager;
}



@end

