//
//  UIColor+RGBColor.h
//  sis-client
//
//  Created by Alex on 15/12/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGBColor)

/**
 根据传入的值自动生成颜色(默认alpha=1)

 @param red 红色值,超过1时按最大值255计算
 @param green 绿色值,超过1时按最大值255计算
 @param blue 蓝色值,超过1时按最大值255计算
 @return 生成的颜色值
 */
+ (UIColor *)getColorWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


/**
 根据十六进制串生成颜色值

 @param hex 十六进制颜色值
 @return 生成的颜色值
 */
+ (UIColor *)getColorWithHexString:(NSString *)hex;

@end
