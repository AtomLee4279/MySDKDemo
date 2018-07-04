//
//  MySDK.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "MySDK.h"
#import "MySDKNetWorking.h"
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
    [MySDKNetWorking myRequestWithType:@"init" param:param];
    
}

-(void)delegateToCPWithType:(NSString *)type andParam:(NSDictionary *)param
{
    if ([type isEqualToString:@"init"]) {
        if ([self.delegate respondsToSelector:@selector(KolaDidFinishInit:)]) {
            [self.delegate KolaDidFinishInit:param];
        }
    }
    
}

@end
