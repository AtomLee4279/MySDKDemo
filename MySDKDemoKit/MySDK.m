//
//  MySDK.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDK.h"
#import "MySDKNetWorking.h"
#import "KolaDelegateTest.h"
@class MySDK;
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

+ (void)Kola_InitWithParam:(NSDictionary*)param
{
    [MySDKNetWorking myRequestWithType:@"init" andParam:nil];
    
}

-(void)delegateToCPWithType:(NSString *)type andParam:(NSDictionary *)param
{
    
    if ([[MySDK shareInstance].delegate respondsToSelector:@selector(KolaDidFinishInit:)]) {
        [[MySDK shareInstance].delegate KolaDidFinishInit:param];
    }
}

@end
