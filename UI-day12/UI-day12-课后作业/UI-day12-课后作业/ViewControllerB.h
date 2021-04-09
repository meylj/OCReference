//
//  ViewControllerB.h
//  UI-day12-课后作业
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProtocol.h"

@interface ViewControllerB : UIViewController

@property (nonatomic,copy)NSString *receiveStr;//接受传过来的名字

@property (nonatomic,weak)id<MyProtocol> delegate;//代理

@end
