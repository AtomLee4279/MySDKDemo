//
//  MySDK.h
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//



#import "MySDKConfig.h"
#import "MySDKNetWorkController.h"

@class MySDK;

@protocol KolaDelegate <NSObject>

@required
//初始化成功回调方法
-(void)KolaDidInitFinish:(NSDictionary*)initRuslt;

//登录成功回调方法
-(void)KolaDidLoginFinish:(NSDictionary*)LoginResult;

//sdk功能（初始化、登录..）调用失败的回调方法（两种情况：1.网络请求成功，调用失败；2.网络原因，网络请求失败）
-(void)KolaHandleFail:(NSString*)failType andDtail:(NSDictionary*)detail;

@end

@interface MySDK :NSObject

@property(weak,nonatomic) id<KolaDelegate> delegate;

//-(void)delegateToCPWithType:(NSString*)type andParam:(NSDictionary*)param;

//单例
+ (instancetype)shareInstance;

/**
 初始化
 */
+ (void)Kola_Init;


-(BOOL)checkInitParam;

+ (void)Kola_Login;
@end
