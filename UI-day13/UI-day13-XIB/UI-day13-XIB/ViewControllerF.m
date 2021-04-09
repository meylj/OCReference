//
//  ViewControllerF.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerF.h"

@interface ViewControllerF ()

@end

@implementation ViewControllerF

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置滚动区域
    _myScrollView.contentSize = CGSizeMake(_myScrollView.frame.size.width*3, _myScrollView.frame.size.height);
    
    //自动向下偏移64关闭
    self.automaticallyAdjustsScrollViewInsets = NO;

}



@end
