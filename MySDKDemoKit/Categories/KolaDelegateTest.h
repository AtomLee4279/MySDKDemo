//
//  KolaDelegateTest.h
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/7/4.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KolaDelegateTest;

@protocol KolaDelegate <NSObject>

//1.初始化回调方法
-(void)KolaInitDelegate:(NSDictionary*)initRuslt;

//2.登录回调方法
-(void)KolaLoginDelegate:(NSDictionary*)LoginResult;

@end


@interface KolaDelegateTest : NSObject

@property(weak,nonatomic) id<KolaDelegate> delegate;

-(void)delegateToCPWithType:(NSString*)type andParam:(NSDictionary*)param;
@end
