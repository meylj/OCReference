//
//  Group.m
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "Group.h"

@implementation Group


- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化数组
        _perArr = [[NSMutableArray alloc] init];
        //_perArr = [NSMutableArray new];
        
        //初始为展开
        _isOpen =YES;
    }
    return self;
}

@end
