//
//  ZYHeaderView.m
//  团购模拟
//
//  Created by 章芝源 on 16/2/2.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYHeaderView.h"
// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import "Masonry.h"
@implementation ZYHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    
}

- (void)layoutSubviews
{
    //图片轮播器
    UIView *redView = [[UIView alloc]init];
    [self addSubview:redView];
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.topMargin.equalTo(self).offset(10);
        make.height.equalTo(self).multipliedBy(0.7);
        make.width.equalTo(self).multipliedBy(0.8);
    }];
    redView.backgroundColor = [UIColor redColor];
    
    //分割线1
    UIView *seperationFirst = [[UIView alloc]init];
    seperationFirst.backgroundColor = [UIColor grayColor];
    [self addSubview:seperationFirst];
    [seperationFirst makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(redView.bottom).offset(20);
        make.height.equalTo(1);
        make.width.equalTo(self.bounds.size.width);
    }];
    
    //分割线2
    UIView *seperationSec = [[UIView alloc]init];
    seperationSec.backgroundColor = [UIColor grayColor];
    [self addSubview:seperationSec];
    [seperationSec makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(1);
        make.width.equalTo(self.bounds.size.width);
        make.bottomMargin.equalTo(self.bottom).offset(-20);
    }];
    
    //猜你喜欢
    UILabel *label = [[UILabel alloc]init];
    label.text = @"猜你喜欢";
    label.textColor = [UIColor blueColor];
    [self addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(self).offset(20);
        make.width.equalTo(self.bounds.size.width).multipliedBy(0.5);
        make.topMargin.equalTo(seperationFirst).offset(10);
        make.bottomMargin.equalTo(seperationSec).offset(-10);
    }];

}

@end
