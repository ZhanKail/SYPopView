//
//  SYMenu.h
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SYMenu : NSObject

+ (SYMenu *)shareManager;

- (void)showPopMenuSelecteWithFrameWidth:(CGFloat)width
                                  height:(CGFloat)height
                                   point:(CGPoint)point
                                    item:(NSArray *)item
                               didSelect:(void (^)(NSInteger index))didSelect
                             didDeSelect:(void (^)(void))didDeSelect;

@end
