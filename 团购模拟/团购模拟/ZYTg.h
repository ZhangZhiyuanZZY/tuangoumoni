//
//  ZYTg.h
//  团购模拟
//
//  Created by 章芝源 on 16/2/2.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYTg : NSObject
//购买数量
@property(nonatomic, copy)NSString *buyCount;
//图片
@property(copy, nonatomic)NSString *icon;
//价格
@property(copy, nonatomic)NSString *price;
//标题
@property(copy, nonatomic)NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
