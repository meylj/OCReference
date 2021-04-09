//
//  CustomCell.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
   
    //第一次加载这个cell的时候会调用这个方法（只限于XIB自定义）
    NSLog(@"awakeFromNib  self = %p",self);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
