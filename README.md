# SYPopView
### 效果图
![image](https://github.com/ZhanKail/SYPopView/blob/master/SYPopView.gif)
### Usage
```
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
}

- (void)showPopView{
    NSArray *titleArray = @[...];
    [self.button showPopViewWithtitleArray:titleArray didSelect:^(NSInteger index) {
        // do something when select
    } didDeSelect:^{
        // do something when deSelect
    }];
}

- (UIButton *)button{
    if (!_button) {
        // button config...
        [_button addTarget:self action:@selector(showPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
```

### Function
- 可根据`button` 位置向下或者向上弹出菜单视图
- 可根据选择菜单某一项进行请求操作,如动画,刷新视图等
- 可根据不选择 进行请求操作

### Requirements
- iOS 9.0+
- Xocde 9
### Contribution
欢迎对项目提供宝贵意见, 有问题或者新的可添加需求可以 Issue

