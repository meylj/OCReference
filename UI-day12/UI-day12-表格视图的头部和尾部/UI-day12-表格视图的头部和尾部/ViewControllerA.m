//
//  ViewControllerA.m
//  UI-day12-表格视图的头部和尾部
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *_myTableView;
}

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];

    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    //实例化一个输入框
    UITextField *textTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    textTF.borderStyle = UITextBorderStyleBezel;
    textTF.backgroundColor = [UIColor magentaColor];
    textTF.delegate = self;
    //设置表格视图的头部视图是UITextField
    _myTableView.tableHeaderView = textTF;
    
    //实例化一个UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    
    imageView.image = [UIImage imageNamed:@"4.jpg"];
    
    //设置表格视图的尾部视图是一个UIImageView
    _myTableView.tableFooterView = imageView;
    
    [self.view addSubview:_myTableView];

}

#pragma mark-
//行数
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    
//}

//你需要返回一个UIView来作为每组组头的视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    b.frame = CGRectMake(0, 0, 320, 60);
    b.backgroundColor = [UIColor orangeColor];
    [b setTitle:@"组头" forState:UIControlStateNormal];
    
    return b;
    
    
}

//设置组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}
//返回一个UIView作为组尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    label.font = [UIFont boldSystemFontOfSize:20];
    label.text = [NSString stringWithFormat:@"组尾%ld",section];
    label.backgroundColor = [UIColor lightGrayColor];
    return label;
    
}
//设置组尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 60;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    return cell;
}



@end
