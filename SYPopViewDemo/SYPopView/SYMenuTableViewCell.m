//
//  SYMenuTableViewCell.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "SYMenuTableViewCell.h"
#import "UIColor+HexColor.h"
#import <Masonry.h>
#import "SYUIConstant.h"
@implementation SYMenuTableViewCell{
    CGFloat _width;
    CGFloat _height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                        width:(CGFloat)width
                       height:(CGFloat)height
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _width = width;
        _height = height;
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.contextLabel];
        [self.contextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.offset(0);
        }];
    }
    return self;
}

- (void)setContentByTitleArray:(NSMutableArray *)titleArray row:(NSInteger)row{
    self.contextLabel.text = titleArray[row];
}

#pragma mark - G&S
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor hexFloatColor:@"#979797" alpha:1];
        _lineView.frame = CGRectMake(20, 0, 80, 2);
    }
    return _lineView;
}

- (UILabel *)contextLabel{
    if (!_contextLabel) {
        _contextLabel = [[UILabel alloc]init];
        _contextLabel.textColor = [UIColor hexFloatColor:@"#425066" alpha:1];
        _contextLabel.font = [UIFont systemFontOfSize:12];
        _contextLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contextLabel;
}

@end
