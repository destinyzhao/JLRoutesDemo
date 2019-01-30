//
//  JsonHelper.h
//  JLRoutesDemo
//
//  Created by Destiny on 2019/1/29.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonHelper : NSObject

+ (NSString *)dataTOjsonString:(id)object;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
