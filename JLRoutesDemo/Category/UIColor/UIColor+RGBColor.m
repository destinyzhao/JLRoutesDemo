//
//  UIColor+RGBColor.m
//  sis-client
//
//  Created by Alex on 15/12/10.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "UIColor+RGBColor.h"

@implementation UIColor (RGBColor)

+ (UIColor *)getColorWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue
{
    CGFloat r = red > 1 ? red / 255. : red;
    CGFloat g = green > 1 ? green / 255. : green;
    CGFloat b = blue > 1 ? blue / 255. : blue;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

/*!
 *@brief        根据十六进制串生成颜色值
 *@function     getColorWithHexString:
 *@param        hex         -- 十六进制颜色串(aabb11, 0xaabb11, 0xaabb11cc)
 *@return       (UIColor)   -- 生成的颜色值
 */
+ (UIColor *)getColorWithHexString:(NSString *)hex
{
    // String should be 6 or 8 characters
    if ([hex length] < 6) return [UIColor whiteColor];
    
    NSString *hex0 = [NSString stringWithFormat:@"%@", hex];
    if ([hex0 hasPrefix:@"0x"] || [hex0 hasPrefix:@"0X"]) {
        hex0 = [NSString stringWithFormat:@"%@", [hex substringFromIndex:2]];
    } else if ([hex0 hasPrefix:@"#"] ) {
        hex0 = [NSString stringWithFormat:@"%@", [hex substringFromIndex:1]];
    }
    if ([hex0 length] != 6) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [hex0 substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [hex0 substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [hex0 substringWithRange:range];
    
    float alpha = 1.0f;
    if ([hex0 length] > 6) {
        uint al;
        [[NSScanner scannerWithString:bString] scanHexInt:&al];
        alpha = (float)al / 255.f;
    }
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
    
}

@end
