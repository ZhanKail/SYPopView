//
//  SYMenuView.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "SYMenuView.h"
#import "SYMenuTableViewCell.h"
#import "UIColor+HexColor.h"
#import "SYUIConstant.h"
static NSString *const kSYMenuCellID = @"kSYMenuCellID";

@implementation SYMenuView

#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame menuWidth:(CGFloat)width height:(CGFloat)height point:(CGPoint)point items:(NSArray *)items didSelect:(void (^)(NSInteger))didSelect didDeSelect:(void (^)(void))didDeSelect{
    
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0,SYScreenWidth , SYScreenHeight);
        [self.titleSource removeAllObjects];
        self.titleSource = [items copy];
        __weak typeof(self)weakSelf = self;
        if (didSelect) {
            weakSelf.indexBlock = ^(NSInteger row) {
                didSelect(row);
            };
        }
        if (didDeSelect) {
            weakSelf.touchBlock = ^{
                didDeSelect();
            };
        }
        [self addSubview:self.tableView];
        self.tableView.frame = CGRectMake(point.x, point.y, width, height);
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SYkMenuItemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SYMenuTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kSYMenuCellID width:self.layerWidth height:SYkMenuItemHeight];
    }
    if (indexPath.row == 0) {
        cell.lineView.hidden = YES;
    }
    [cell setContentByTitleArray:self.titleSource row:indexPath.row];
    cell.contextLabel.text = self.titleSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.indexBlock) {
        self.indexBlock(indexPath.row);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.touchBlock) {
        self.touchBlock();
    }
}

#pragma mark - G&S
- (NSMutableArray *)titleSource{
    if (!_titleSource) {
        _titleSource = [NSMutableArray array];
    }
    return _titleSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SYMenuTableViewCell class] forCellReuseIdentifier:kSYMenuCellID];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.layer.borderColor = [[UIColor hexFloatColor:@"#425066" alpha:1] CGColor];
        _tableView.layer.borderWidth = 2;
    }
    return _tableView;
}




@end
