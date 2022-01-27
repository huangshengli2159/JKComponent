//
//  UIColor+JKUtilO.m
//  Jeetuok
//
//  Created by sl on 2022/1/27.
//

#import "UIColor+JKUtilO.h"

@implementation UIColor (JKUtilO)

+ (UIColor *)colorByHexString:(NSString *)hexString {
    return [self colorByHexString:hexString alpha:1.0f];
}

+ (UIColor *)colorByHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    // 删除字符串中的空格
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 字符串长度应该是6到8
    NSParameterAssert(6 <= cString.length && cString.length <= 8);
    
    // 如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    // 经过处理后的字符串应该是6位
    NSParameterAssert(cString.length == 6);
    
    // 截取出R、G、B字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    // R
    NSString *rString = [cString substringWithRange:range];
    // G
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    // B
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // 转化成int
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (@available(iOS 10.0, *)) {
        return [UIColor colorWithDisplayP3Red:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
    } else {
        // Fallback on earlier versions
        return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
    }
}

@end
