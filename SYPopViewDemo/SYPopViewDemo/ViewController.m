//
//  ViewController.m
//  SYPopViewDemo
//
//  Created by 张枞楷 on 2018/7/14.
//  Copyright © 2018年 张枞楷. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+SYMenu.h"
@interface ViewController ()

@property(nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
}

- (void)showPopView{
    NSArray *titleArray = @[@"律诗",@"绝句",@"六言诗",@"古风",@"排律",@"词",@"句"];
    [self.button showPopViewWithtitleArray:titleArray didSelect:^(NSInteger index) {
        // do something when select
        NSLog(@"%ld",index);
    } didDeSelect:^{
        // do something when deSelect
        NSLog(@"deSelect");
    }];
}

- (UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(275, 100, 100, 100)];
        _button.backgroundColor = [UIColor lightGrayColor];
        [_button addTarget:self action:@selector(showPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
