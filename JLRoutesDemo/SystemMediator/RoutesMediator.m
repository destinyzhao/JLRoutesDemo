//
//  RoutesMediator.m
//  JLRoutesDemo
//
//  Created by Destiny on 2019/1/29.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "RoutesMediator.h"
#import "JLRoutes.h"
#import "UIViewController+CurrentVC.h"

@interface RoutesMediator ()


@end

@implementation RoutesMediator

+ (instancetype)sharedInstance {
    static RoutesMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[RoutesMediator alloc] init];
    });
    return mediator;
}

/**
 无参路由注册
 */
- (void)registerModuleNoParameters {
    [[JLRoutes globalRoutes] addRoute:@"/:module/:target/:Modal" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self goTargetViewController:parameters isParam:NO];
    }];
}

/**
 有参路由注册
 */
- (void)registerModuleParameters {
    [[JLRoutes globalRoutes] addRoute:@"/:module/:target/:Modal/:parameter" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return [self goTargetViewController:parameters isParam:YES];
    }];
}


/**
 页面跳转

 @param parameters 参数
 @param isParam 是否有参数
 @return Bool
 */
- (BOOL)goTargetViewController:(NSDictionary *)parameters isParam:(BOOL)isParam{
    NSString *targetClassString = parameters[@"target"];
    Class targetClass = NSClassFromString(targetClassString);
    id object = [[targetClass alloc] init];
    
    NSString *modal = parameters[@"Modal"];
    // 有参数设置参数
    if (isParam) {
        if ([object respondsToSelector:@selector(setParameterJsonString:)]) {
            [object performSelector:@selector(setParameterJsonString:) withObject:parameters[@"parameter"]];
        }
    }
    
    if ([object isKindOfClass:[UIViewController class]]) {
        // 目标视图控制器
        UIViewController *taegetVC = (UIViewController *)object;
        // 获取当前视图控制器
        UIViewController *currentViewController = [UIViewController getCurrentViewController];
        // Push
        if ([modal isEqualToString:@"push"]) {
            [currentViewController.navigationController pushViewController:taegetVC animated:YES];
        }
        else{
            // present
            if ([taegetVC respondsToSelector:@selector(setVCModal:)]) {
                [taegetVC performSelector:@selector(setVCModal:) withObject:@"present"];
            }
            BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:taegetVC];
            [currentViewController presentViewController:nav animated:YES completion:nil];
        }
        return YES;
    } else {
        return NO;
    }
}

/**
 页面跳转无参
 
 @param url 目标页面的url
 */
- (void)openModuleWithURL:(NSURL *)url{
  
    [self registerModuleNoParameters];
    [self openUrl:url];
}

/**
 页面跳转有参数
 
 @param url 目标页面的url
 */
- (void)openModuleWithURLParameters:(NSURL *)url{
    
    [self registerModuleParameters];
    [self openUrl:url];
}

- (void)openUrl:(NSURL *)url{
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (success) {
            [[JLRoutes globalRoutes] routeURL:url];
        }
    }];
}

@end
