//
//  CustomCell.m
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //自定义的控件
        //头像视图
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 44, 44)];
        
        [self.contentView addSubview:_headImageView];
        //名字
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 22)];
        [self.contentView addSubview:_nameLabel];
        //签名
        _markLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 22, 250, 22)];
        _markLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_markLabel];
        
        
        
        
        
    }
    
    
    return self;
    
    
}



@end
