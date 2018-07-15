//
//  SYMenuView.h
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBlock)(void);
typedef void(^IndexBlock)(NSInteger row);
@interface SYMenuView: UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, copy) TouchBlock touchBlock;
@property (nonatomic, copy) IndexBlock indexBlock;
@property (nonatomic, assign) CGFloat layerWidth;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleSource;

- (instancetype)initWithFrame:(CGRect)frame
                    menuWidth:(CGFloat)width
                       height:(CGFloat)height
                        point:(CGPoint)point
                        items:(NSArray *)items
                    didSelect:(void(^)(NSInteger index))didSelect
                  didDeSelect:(void (^)(void))didDeSelect;

@end
