//
//  MySDKLoginController.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/9/13.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDKLoginController.h"

@implementation MySDKLoginController

+ (instancetype)shareInstance {
    
    static MySDKLoginController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        instance = [super new];
        instance = [[self alloc]init];
        [MySDKNetWorkController shareInstance].delegate = instance;
    });
    return instance;
}

-(void)mySDKLogin
{
    //模型转字典
//    NSDictionary *dict = [[MySDKConfig shareInstance] mj_keyValues];
//    //字符串签名，返回字典格式
//    NSDictionary* uploadData = [NSString signDictionaryWithParameters:dict appKey:[MySDKConfig shareInstance].appkey];
//    [MySDKNetWorkController requestInitWithParam:uploadData];
}

-(void)NetWorkRespondSuccessDelegate:(nullable NetWorkRespondModel*)result {
    
    NSLog(@"--MySDKInitController--NetWorkRespondSuccessDelegate");

    
    
}

- (void)NetWorkRespondFailDelegate:(nullable NetWorkRespondModel*)result {
    
    NSLog(@"--MySDKInitController--NetWorkRespondFailDelegate");
    //网络问题导致登录化失败
  
    
}

@end
