//
//  UIButton+SYMenu.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/15.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "UIButton+SYMenu.h"
#import "SYMenu.h"
#import "SYUIConstant.h"
@implementation UIButton (SYMenu)

- (void)showPopViewWithtitleArray:(NSArray *)titleArray didSelect:(void (^)(NSInteger))didSelect didDeSelect:(void (^)(void))didDeSelect{
    
    //TODO: 固定的宽度, 后期实现宽度自定义
    CGFloat popViewWidth = SYPopViewWidth;
    CGFloat popViewHeight = titleArray.count>SYMaxItem? SYMaxItem*SYkMenuItemHeight:titleArray.count*SYkMenuItemHeight;
    CGRect rect = [self convertRect:self.bounds toView:nil];
    CGPoint point = rect.origin;
    point.y = rect.size.height + rect.origin.y;
    point.x = rect.size.width + rect.origin.x - popViewWidth;
    
    // 加上四周的判断
    if (point.y + popViewHeight > SYScreenHeight) {
        point.y = rect.origin.y-popViewHeight>0?rect.origin.y-popViewHeight:point.y;
    }
    
    if (point.x < 0) {
        point.x = 0;
    }
    
    [[SYMenu shareManager] showPopMenuSelecteWithFrameWidth:popViewWidth
                                                     height:popViewHeight
                                                      point:point
                                                       item:titleArray
                                                  didSelect:^(NSInteger index) {
                                                      if (didSelect) {
                                                          didSelect(index);
                                                      }
                                                  } didDeSelect:^{
                                                      if (didDeSelect) {
                                                          didDeSelect();
                                                      }
                                                  }];
}

@end
