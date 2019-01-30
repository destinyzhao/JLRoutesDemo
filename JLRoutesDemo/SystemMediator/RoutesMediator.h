//
//  RoutesMediator.h
//  JLRoutesDemo
//
//  Created by Destiny on 2019/1/29.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RoutesMediator : NSObject

+ (instancetype)sharedInstance;

/**
 页面跳转无参

 @param url 目标页面的url
 */
- (void)openModuleWithURL:(NSURL *)url;


/**
 页面跳转有参数

 @param url 目标页面的url
 */
- (void)openModuleWithURLParameters:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
