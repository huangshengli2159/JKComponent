//
//  UIColor+JKUtilO.h
//  Jeetuok
//
//  Created by sl on 2022/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JKUtilO)

/**
 *  @author leo.li, 16-06-08 10:06:38
 *
 *  @brief 将16进制颜色字符串转成UXColor对象
 *
 *  @param hexString 6进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @return 返回相应的UXColor对象
 *
 *  @since 510
 */
+ (UIColor *)colorByHexString:(NSString *)hexString;

/**
 *  @brief 将16进制颜色字符串按照指定透明度转成UIColor对象
 *
 *  @param hexString 16进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha           颜色的透明度
 *
 *  @return 返回相应的UIColor对象
 */
+ (UIColor *)colorByHexString:(NSString *)hexString alpha:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END
