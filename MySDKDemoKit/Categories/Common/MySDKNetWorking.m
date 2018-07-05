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
#import "MySDKConfig.h"
#import "NSString+Sign.h"
#import <MJExtension.h>
#define DBLog(fmt,...) NSLog((@"【方法名】：%s\n""#Koala DEBUG# " fmt), __func__, ##__VA_ARGS__)
#define NetLog(fmt,...) NSLog((@"【方法名】：%s\n""#Koala NET#" fmt),  __func__, ##__VA_ARGS__)

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
        return;
    }
    //模型转字典
    NSDictionary *tmpDic = [param mj_keyValues];
    //字符串签名，返回字典
    NSDictionary* uploadData = [NSString signDictionaryWithParameters:tmpDic appKey:[MySDKConfig shareInstance].appkey];
    DBLog(@"%@，上传的参数：%@", type,uploadData);
    [[MySDKNetWorking new].manager POST:requestUrl
                             parameters:uploadData
                               progress:NULL
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    //请求成功
//                                    NSLog(@"--%@请求成功，返回数据--：%@",type,responseObject);
                                    NetLog(@"%@#网络请求成功,\n返回数据：%@", type,responseObject);
                                    [[MySDK shareInstance] delegateToCPWithType:type andParam:responseObject];
                                    
                                    
                                }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    
                                    NSDictionary *dict = @{
                                                            @"task":task,
                                                            @"error":error
                                                          };
                                    
                                    NetLog(@"\n#%@#网络请求失败！请检查网络：%@", type,dict);
                                    //请求失败
                                    [[MySDK shareInstance] delegateToCPWithType:@"NetWorkFail" andParam:dict];
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

