//
//  MySDKNetWorking.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/7/4.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDKNetWorkController.h"
#import <AFNetworking.h>
#import "MySDK.h"
#import "MySDKConfig.h"
#import "NSString+Sign.h"
#import "KKDebug.h"
#import <MJExtension.h>

static NSString * const myBaseURLString = @"https://api.sdk.gzkaola.com"; // 正式 -- 最新2018.05.30开始使用

#pragma mark - URLS
/** 初始化 */
static NSString * const myURLInit = @"App/Basic/Init";

@interface MySDKNetWorkController ()

@property(strong, nonatomic) AFHTTPSessionManager *manager;
//保存浏览器信息
@property(copy, nonatomic) NSString *userAgent;

@end

@implementation MySDKNetWorkController


#pragma mark - method
+(void)myRequestWithType:(NSString*)type
                   param:(nullable id)param
{
    NSString *requestUrl = @"";
    if ([type isEqualToString:@"init"]) {
        requestUrl = myURLInit;
    }
    else{
        NSLog(@"--请检查请求接口调用参数type！--");
        return;
    }
    
    DBLog(@"%@，上传的参数：%@", type,param);
    [[MySDKNetWorkController new].manager POST:requestUrl parameters:@"" progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NetLog(@"%@#网络请求,\n返回数据：%@", type,responseObject);
        //网络请求成功：告诉cp功能调用成功/失败（失败原因有待详查）
        [[MySDK shareInstance] delegateToCPWithType:[responseObject[@"result"] boolValue]?type:@"Fail" andParam:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NetLog(@"\n#%@#网络请求失败！请检查网络：%@", type,[error mj_keyValues]);
        //网络请求失败，告诉cp功能调用失败
        [[MySDK shareInstance] delegateToCPWithType:@"Fail" andParam:[error mj_keyValues]];
        
    }];
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

