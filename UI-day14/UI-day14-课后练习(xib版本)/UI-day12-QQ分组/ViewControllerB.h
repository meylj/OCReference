//
//  ViewControllerB.h
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewControllerB : UIViewController
//名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//心情
@property (weak, nonatomic) IBOutlet UILabel *markLabel;

@property (nonatomic,strong)Person *myModel;//接受参数

@end
