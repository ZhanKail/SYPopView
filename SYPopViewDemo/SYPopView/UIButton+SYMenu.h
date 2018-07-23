//
//  UIButton+SYMenu.h
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/15.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SYMenu)

/**
 位于 button 下面的 下弹视图
 
 @param titleArray 下弹视图显示的titleList
 @param didSelect 当选择 titleList 的某一项时响应的动作 并返回 点击的 index
 @param didDeSelect 当点击旁边 隐藏视图时响应的动作
 */
- (void)showPopViewWithtitleArray:(NSArray *)titleArray
                        didSelect:(void (^)(NSInteger index))didSelect
                      didDeSelect:(void (^)(void))didDeSelect;

@end
