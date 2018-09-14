//
//  MySDK.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDK.h"
#import "NSString+Sign.h"
#import <MJExtension.h>
#import "MySDKInitController.h"
#import "NSString+UniqueStrings.h"
#import "MySDKLoginController.h"


@implementation MySDK

+ (instancetype)shareInstance {
    
    static MySDK *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        instance = [super new];
        instance = [[self alloc]init];
    });
    return instance;
}

+ (void)Kola_Init
{
    //检查初始化参数　
    if ([[MySDK shareInstance]checkInitParam]) {
         [[MySDKInitController shareInstance] mySDKInit];
    }
}

-(BOOL)checkInitParam{
    if (!([MySDKConfig shareInstance].appid&&[MySDKConfig shareInstance].appkey&&[MySDKConfig shareInstance].channel)) {
        Toast(@"appid/appkey/channel不能为空！请检查sdk初始化填入参数", 1.0f);
        return NO;
    }
    return YES;
}


+ (void)Kola_Login{
    
    [[MySDKLoginController shareInstance] mySDKLogin];
    
}




@end
