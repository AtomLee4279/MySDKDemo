//
//  ViewController.m
//  MySDKDemo
//
//  Created by 李一贤 on 2018/6/26.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

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
    
//    NSDictionary *dict = [NSDictionary dictionary];
//    NSDictionary *dict = @{@"name":@"lnj", @"phone":@"12345678", @"address":@"天朝"};
    [MySDK Kola_InitWithParam:[NSDictionary dictionary]];
    
}

-(void)KolaDidFinishInit:(NSDictionary *)initRuslt
{
    NSLog(@"aaa");
}
@end
