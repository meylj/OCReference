//
//  ViewControllerB.m
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = self.myModel.name;
    
    self.headImageView.image = [UIImage imageNamed:self.myModel.headImageName];


}



@end
