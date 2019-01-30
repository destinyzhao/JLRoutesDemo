//
//  UIViewController+CurrentVC.h
//  SurveyManagement
//
//  Created by Destiny on 2018/6/28.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentVC)

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentViewController;

@end
