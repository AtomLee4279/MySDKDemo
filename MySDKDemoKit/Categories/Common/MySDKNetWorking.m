//
//  MySDKNetWorking.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/7/4.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDKNetWorking.h"
#import <AFNetworking.h>
#import "MySDK.h"

static NSString * const myBaseURLString = @"https://api.sdk.gzkaola.com"; // 正式 -- 最新2018.05.30开始使用

#pragma mark - URLS
/** 初始化 */
static NSString * const myURLInit = @"App/Basic/Init";

@interface MySDKNetWorking ()

@property(strong, nonatomic) AFHTTPSessionManager *manager;
//保存浏览器信息
@property(copy, nonatomic) NSString *userAgent;

@end

@implementation MySDKNetWorking


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
    }
    
    [[MySDKNetWorking new].manager POST:requestUrl
                             parameters:param
                               progress:NULL
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    //请求成功
                                    NSLog(@"--%@请求成功，返回数据--：%@",type,responseObject);
                                    [[MySDK shareInstance] delegateToCPWithType:type andParam:responseObject];
                                    
                                    
                                }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    //请求失败
                                    
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

