//
//  UIViewController+CurrentVC.m
//  SurveyManagement
//
//  Created by Destiny on 2018/6/28.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "UIViewController+CurrentVC.h"

@implementation UIViewController (CurrentVC)

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentViewController
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentViewControllerFromRootVC:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentViewControllerFromRootVC:(UIViewController *)rootVC
{
    UIViewController *currentViewController;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentViewController = [self getCurrentViewControllerFromRootVC:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentViewController = [self getCurrentViewControllerFromRootVC:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentViewController = rootVC;
    }
    
    return currentViewController;
}


@end
