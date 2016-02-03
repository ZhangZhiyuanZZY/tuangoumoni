//
//  ZYTableViewCell.m
//  团购模拟
//
//  Created by 章芝源 on 16/2/2.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYTableViewCell.h"
#import "ZYTg.h"
// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
#import "Masonry.h"

@interface ZYTableViewCell()
@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UILabel *titleLb;
@property(nonatomic, strong)UILabel *priceLb;
@property(nonatomic, strong)UILabel *countLb;
@end
@implementation ZYTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTg:(ZYTg *)tg
{
    _tg = tg;
    NSString *icon = tg.icon;
    self.iconImageView.image = [UIImage imageNamed:icon];
    self.titleLb.text = tg.title;
    self.priceLb.text = [NSString stringWithFormat:@"￥%@", tg.price];
    self.countLb.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 懒加载
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        [self addSubview:_iconImageView];
        self.iconImageView = _iconImageView;
        [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(self.width).multipliedBy(0.25);
        }];
    }
    return _iconImageView;
}

- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.textColor = [UIColor blackColor];
        [self addSubview:_titleLb];
        [_titleLb makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.top).offset(0);
            make.left.equalTo(self.iconImageView.right).offset(10);
            make.height.equalTo(self.iconImageView.height).multipliedBy(0.4);
            make.width.equalTo(100);
        }];
    }
    return _titleLb;
}

- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [[UILabel alloc]init];
        _priceLb.textColor = [UIColor orangeColor];
        [self addSubview:_priceLb];
        [_priceLb makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.right).offset(10);
            make.bottom.equalTo(self.iconImageView.bottom).offset(0);
            make.width.equalTo(100);
            make.height.equalTo(self.iconImageView.height).multipliedBy(0.3);
        }];
    }
    return _priceLb;
}

- (UILabel *)countLb
{
    if (!_countLb) {
        _countLb = [[UILabel alloc]init];
        _countLb.textColor = [UIColor lightGrayColor];
        _countLb.textAlignment = NSTextAlignmentRight;
        [self addSubview:_countLb];
        [_countLb makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImageView.bottom).offset(0);
            make.right.equalTo(self.right).offset(0);
            make.width.equalTo(150);

            make.height.equalTo(self.iconImageView.height).multipliedBy(0.3);
        }];
    }
    return _countLb;
}
@end
