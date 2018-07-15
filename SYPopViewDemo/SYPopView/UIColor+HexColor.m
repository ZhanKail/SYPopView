//
//  UIColor+HexColor.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+ (UIColor *)hexFloatColor:(NSString *)hexStr alpha:(CGFloat)alpha{
    // 兼容 hexStr 前不带 #
    if(![[hexStr substringToIndex:1] isEqualToString:@"#"]){
        hexStr = [NSString stringWithFormat:@"#%@",hexStr];
    }
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}


@end
