//
//  ZYFooterView.m
//  团购模拟
//
//  Created by 章芝源 on 16/2/2.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYFooterView.h"
// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import "Masonry.h"


@interface ZYFooterView()
@property(nonatomic, strong)UIButton *moreInfoBtn;
@property(nonatomic, strong)UIView *loadingView;
@property(nonatomic, strong)UIActivityIndicatorView *active;

@end
@implementation ZYFooterView

//设置
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置UI
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self.moreInfoBtn addTarget:self action:@selector(moreInfoClick) forControlEvents:UIControlEventTouchUpInside];
    [self.moreInfoBtn setTitle:@"绝对没有空的!" forState:UIControlStateNormal];
//    self.loadingView.backgroundColor = [UIColor blueColor];
//    self.moreInfoBtn.hidden = YES;
    self.loadingView.hidden = YES;
    UIActivityIndicatorView *active = [[UIActivityIndicatorView alloc]init];
    self.active = active;
    active.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.loadingView addSubview:active];
    [active makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loadingView.top).offset(10);
        make.bottom.equalTo(self.loadingView.bottom).offset(-10);
        make.width.equalTo(60);
        make.centerY.equalTo(self.loadingView);
        make.left.equalTo(self.loadingView.left).offset(20);
    }];
    active.hidden = NO;
    NSLog(@"%@", active);
    
    UILabel *loadingLb = [[UILabel alloc]init];
    loadingLb.text = @"偶尔有个空的也情有可原ing";
    [self.loadingView addSubview:loadingLb];
    [loadingLb makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loadingView.top).offset(10);
        make.bottom.equalTo(self.loadingView.bottom).offset(-10);
        make.left.equalTo(active.right).offset(10);
        make.right.equalTo(self.loadingView.right).offset(-10);
    }];
}

//点击加载更多
- (void)moreInfoClick
{
    self.moreInfoBtn.hidden = YES;
    self.loadingView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //向tableView中插入一条数据
        if (self.addInfoBlock) {
            self.addInfoBlock();
        }

        self.moreInfoBtn.hidden = NO;
        self.loadingView.hidden = YES;
         [self.active startAnimating];
    });
    [self.active stopAnimating];
}

#pragma mark - 懒加载

- (UIButton *)moreInfoBtn
{
    if (!_moreInfoBtn) {
        _moreInfoBtn = [[UIButton alloc]init];
        self.moreInfoBtn.backgroundColor = [UIColor redColor];
        self.moreInfoBtn = _moreInfoBtn;
        [self addSubview:_moreInfoBtn];
        [_moreInfoBtn makeConstraints:^(MASConstraintMaker *make) {
            UIEdgeInsets inset = UIEdgeInsetsMake(10, 10, 10, 10);
            make.edges.equalTo(self).offset(inset);
        }];
        
    }
    return _moreInfoBtn;
}

- (UIView *)loadingView
{
    if (!_loadingView) {
        _loadingView = [[UIView alloc]init];
        _loadingView.backgroundColor = [UIColor clearColor];
        [self addSubview:_loadingView];
        [_loadingView makeConstraints:^(MASConstraintMaker *make) {
            UIEdgeInsets inset = UIEdgeInsetsMake(10, 10, 10, 10);
            make.edges.equalTo(self).offset(inset);

        }];
    }
    return _loadingView;
}


@end
