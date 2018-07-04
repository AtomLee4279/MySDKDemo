//
//  MySDK.h
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MySDK;

@protocol KolaDelegate <NSObject>

//1.初始化回调方法
-(void)KolaDidFinishInit:(NSDictionary*)initRuslt;

//2.登录回调方法
-(void)KolaDidFinishLogin:(NSDictionary*)LoginResult;

@end

@interface MySDK :NSObject

@property(strong,nonatomic) id<KolaDelegate> delegate;

//-(void)delegateToCPWithType:(NSString*)type andParam:(NSDictionary*)param;

//单例
+ (instancetype)shareInstance;

/**
 初始化
 */
+ (void)Kola_InitWithParam:(NSDictionary*)param;

@end
