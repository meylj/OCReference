//
//  FoodModel.h
//  超级好吃饭店
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodModel : NSObject

@property (nonatomic,copy)NSString *foodName;//菜名
@property (nonatomic,copy)NSString *foodImageViewName;//菜的图片名字
@property (nonatomic,copy)NSString *priceStr;//价格
@property (nonatomic,copy)NSString *sellStr;//销售量

@end
