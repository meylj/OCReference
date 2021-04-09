//
//  CustomCell.h
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//心情
@property (weak, nonatomic) IBOutlet UILabel *markLabel;

@end
