//
//  CustomCell.h
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
//名字label
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//头像视图（不允许使用imageView为名字）
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;



@end
