//
//  ViewControllerG.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerG.h"
#import "CustomCell.h"

@interface ViewControllerG ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewControllerG

- (void)viewDidLoad {
    [super viewDidLoad];

    //用xib自定义cell才需要注册
    //提前注册cell
    /*
     参数1：就是xib文件
     参数2：就是这个cell所打上的标签
     
     */
    //注册完成之后队列里面就存在了相应的cell
    [_myTableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"myCell"];

}

#pragma mark-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
  /*
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
   */
    
    //cell.textLabel.text = @"大家好";
    //设置名字
    cell.nameLabel.text = @"小红";
    //设置头像
    cell.headImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%03ld",indexPath.row+1]];
    
    return cell;
    
}

@end
