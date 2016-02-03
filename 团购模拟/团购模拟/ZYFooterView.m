//
//  ZYFooterView.m
//  团购模拟
//
//  Created by 章芝源 on 16/2/2.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYFooterView.h"
@interface ZYFooterView()
@property (weak, nonatomic) IBOutlet UIButton *moreInfoBtn;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end
@implementation ZYFooterView

//加载xib
+ (instancetype)setupFooterView
{
    return [[NSBundle mainBundle]loadNibNamed:@"ZYFooterView" owner:nil options:nil].lastObject;
}

//设置
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"干蛋啊!");
    }
    return self;
}

//点击之后, 显示按钮正在加载
- (IBAction)moreInfoClick:(id)sender {
    self.moreInfoBtn.hidden = YES;
    self.loadingView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.moreInfoBtn.hidden = NO;
        self.loadingView.hidden = YES;
    });
    //向tableView中插入一条数据
    if (self.addInfoBlock) {
        self.addInfoBlock();
    }
}


@end
