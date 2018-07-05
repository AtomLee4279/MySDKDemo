//
//  ViewController.m
//  MySDKDemo
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import <MySDKDemoKit/MySDKDemoKit.h>

#import "MySDKConfig.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MySDK shareInstance].delegate = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender {
    
    // 初始化
    [MySDKConfig shareInstance].appid =  @"100000";
    [MySDKConfig shareInstance].appkey =  @"123456";
    [MySDKConfig shareInstance].channel = @"appstore100000";
    [MySDK Kola_Init];
    
}

-(void)KolaDidFinishInit:(NSDictionary *)initRuslt
{
    NSLog(@"aaa");
}

-(void)KolaDidFinishLogin:(NSDictionary*)LoginResult{
    NSLog(@"bbb");
    
}

-(void)KolaNetWorkRequestWithFail:(NSDictionary*)Fail{
    
    NSLog(@"ccc");
}
@end
