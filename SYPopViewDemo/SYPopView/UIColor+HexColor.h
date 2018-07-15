//
//  UIColor+HexColor.h
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBa(r,g,b,a) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]

@interface UIColor (HexColor)

+ (UIColor *)hexFloatColor:(NSString *)hexStr alpha:(CGFloat)alpha;

@end

