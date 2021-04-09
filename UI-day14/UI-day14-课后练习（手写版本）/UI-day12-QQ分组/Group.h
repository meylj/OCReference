//
//  Group.h
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic,copy)NSString *groupName;//组名
@property (nonatomic,strong)NSMutableArray *perArr;//好友数组
@property (nonatomic,assign)BOOL isOpen;//是否处于展开

@end
