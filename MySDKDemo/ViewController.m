//
//  ViewController.m
//  MySDKDemo
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import "MyToast.h"
#import <KSToastView.h>

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

- (IBAction)testInit:(id)sender {
    
    // 初始化
    [MySDKConfig shareInstance].appid =  @"100000";
    [MySDKConfig shareInstance].appkey =  @"123456";
    [MySDKConfig shareInstance].channel = @"appstore100000";
    [MySDK Kola_Init];
}
- (IBAction)testLogin:(id)sender {
    
    [MySDK Kola_Login];
    
}


-(void)KolaDidInitFinish:(NSDictionary *)initRuslt{
    
    NSLog(@"aaa");
}

-(void)KolaDidLoginFinish:(NSDictionary*)LoginResult{
    NSLog(@"bbb");
    
}

-(void)KolaHandleFail:(NSString*)failType andDtail:(NSDictionary*)detail{
    
    NSLog(@"ccc");
}
@end
