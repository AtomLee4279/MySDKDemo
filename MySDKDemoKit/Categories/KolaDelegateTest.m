//
//  KolaDelegateTest.m
//  MySDKDemoKit
//
//  Created by 李一贤 on 2018/7/4.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "KolaDelegateTest.h"

@implementation KolaDelegateTest

-(void)delegateToCPWithType:(NSString*)type andParam:(NSDictionary*)param
{
    switch ([type integerValue]) {
            //0:初始化
        case 0:
            if ([self.delegate respondsToSelector:@selector(KolaInitDelegate:)]) {
                [self.delegate KolaInitDelegate:param];
            }
            break;
            
        default:
            break;
    }
}

@end
