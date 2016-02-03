//
//  ViewController.m
//  团购模拟
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYHeaderView.h"
#import "ZYTg.h"
#import "ZYTableViewCell.h"
#import "ZYFooterView.h"

// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import "Masonry.h"


#define ZYSIZE  self.view.bounds.size
@interface ZYViewController ()<UITableViewDataSource>
//头部
@property(nonatomic, strong)UIView *headerView;
//商家栏
@property(nonatomic, strong)UITableView *tableView;
//加载更多
@property(nonatomic, strong)ZYFooterView *footerView;
//模型数组
@property(nonatomic, strong)NSMutableArray *tgs;


@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置UI
    [self setupUI];
}

#pragma mark - 设置UI
- (void)setupUI
{
    self.headerView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
    //注册cell
    [self.tableView registerClass:[ZYTableViewCell class] forCellReuseIdentifier:@"xxx"];
    
    //点击添加一条info
    [self addInfo];
}

- (void)addInfo
{
    __weak typeof(self) weakSelf = self;
    self.footerView.addInfoBlock= ^{
        //1. 向模型数组中添加一条数据
        ZYTg *tg = [[ZYTg alloc]init];
        tg.icon = @"5ee372ff039073317a49af5442748071.png";
        tg.buyCount = @"1000";
        tg.price = @"200";
        tg.title = @"四川蛋蛋面";
        [weakSelf.tgs addObject:tg];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tgs.count - 1 inSection:0];
        [weakSelf.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        //2.将插入的那行滚动到一个不错的位置
        [weakSelf.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    };
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - tableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYTg *tg = self.tgs[indexPath.row];
    ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    cell.tg = tg;

    return cell;
}


#pragma mark - 懒加载
- (UIView *)headerView
{
    if (!_headerView) {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = ZYSIZE.width;
        CGFloat h = ZYSIZE.height * 0.35;
        CGRect frame = CGRectMake(x, y, w, h);
        _headerView = [[ZYHeaderView alloc]initWithFrame:frame];
        self.headerView = _headerView;
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

- (UIView *)footerView
{
    if (!_footerView) {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = ZYSIZE.width;
        CGFloat h = ZYSIZE.height * 0.1;
        _footerView = [[ZYFooterView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        
        self.footerView = _footerView;
        [self.view addSubview:_footerView];
    }
    return _footerView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = ZYSIZE.width;
        CGFloat h = ZYSIZE.height;
        _tableView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:_tableView];
        _tableView.rowHeight = 80;
        self.tableView.dataSource = self;
        self.tableView = _tableView;
    }
    return _tableView;
}

- (NSArray *)tgs
{
    if (!_tgs) {
        _tgs = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arrayTgs = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in arrayTgs) {
            ZYTg *tg = [[ZYTg alloc]initWithDict:dict];
            [arrayM addObject:tg];
        }
        _tgs = arrayM;
    }
    return _tgs;
}

@end
