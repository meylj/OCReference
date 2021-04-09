//
//  ViewControllerB.m
//  UI-day13-课后练习
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 160, 40)];
    label.text = _myModel.name;
    [self.view addSubview:label];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_myModel.headImageName]];
    imageView.frame = CGRectMake(60, 150, 200, 200);
    [self.view addSubview:imageView];


}



@end
