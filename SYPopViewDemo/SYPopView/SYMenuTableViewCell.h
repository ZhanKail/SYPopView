//
//  SYMenuTableViewCell.h
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *contextLabel;
@property (nonatomic, strong) UIView *lineView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                        width:(CGFloat)width
                       height:(CGFloat)height;

- (void)setContentByTitleArray:(NSMutableArray *)titleArray
                           row:(NSInteger)row;

@end
