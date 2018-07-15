//
//  SYMenu.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "SYMenu.h"
#import "SYMenuView.h"
@interface SYMenu()
@property (nonatomic, strong) SYMenuView *menuView;
@end

@implementation SYMenu

+ (SYMenu *)shareManager {
    static SYMenu *menu = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menu = [[SYMenu alloc]init];
    });
    return menu;
}

- (void)showPopMenuSelecteWithFrameWidth:(CGFloat)width height:(CGFloat)height point:(CGPoint)point item:(NSArray *)item didSelect:(void (^)(NSInteger))didSelect didDeSelect:(void (^)(void))didDeSelect{
    __weak typeof (self) weakSelf = self;
    if (self.menuView != nil) {     // 已存在menuView 则隐藏
        [weakSelf hideMenu];
    }
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    self.menuView = [[SYMenuView alloc]initWithFrame:window.bounds
                                           menuWidth:width
                                              height:height
                                               point:point
                                               items:item
                                           didSelect:^(NSInteger index) {
                                               didSelect(index);
                                               [weakSelf hideMenu];
                                           } didDeSelect:^{
                                               didDeSelect();
                                               [weakSelf hideMenu];
                                           }];
    
    self.menuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [window addSubview:self.menuView];
    
}

- (void)hideMenu {
    [self.menuView removeFromSuperview];
    self.menuView = nil;
}


@end
