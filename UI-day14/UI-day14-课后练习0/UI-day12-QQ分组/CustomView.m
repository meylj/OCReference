//
//  CustomView.m
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //小箭头
        self.tipView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
        self.tipView.image = [UIImage imageNamed:@"down"];
        [self addSubview:self.tipView];
        
        //标题
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 30)];
        self.titleLab.textColor = [UIColor purpleColor];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLab];
        
        
    }
    
    return self;
    
}


@end
