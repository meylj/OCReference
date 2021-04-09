//
//  CustomCell.h
//  超级好吃饭店
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;//菜的图片
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;//菜名

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//价格
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;//销售数


@end
