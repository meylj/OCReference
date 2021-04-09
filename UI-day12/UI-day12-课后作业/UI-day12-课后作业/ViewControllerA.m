//
//  ViewControllerA.m
//  UI-day12-课后作业
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"
#import "Person.h"
#import "ViewControllerB.h"


@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
    UITableView *_myTableView;
    NSInteger _selectNum;//记录你选择的是哪一行
}

@end

@implementation ViewControllerA


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        _dataArr= [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 20 ; i++) {
            //加载数据
            Person *perModel = [[Person alloc] init];
            perModel.name =[NSString stringWithFormat:@"好友%d",i+1];
            perModel.headImageName = [NSString stringWithFormat:@"%03d",i+1];
            
            [_dataArr addObject:perModel];
        }
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _myTableView.delegate= self;
    _myTableView.dataSource = self;
    
    [self.view addSubview:_myTableView];
    

}

-(void)receiveName:(NSString *)name{
    
    //修改model里面name的值
    Person *per = _dataArr [_selectNum];
    per.name = name;
    
    //刷新
    [_myTableView reloadData];
    
    
}

#pragma mark-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    Person *per = _dataArr[indexPath.row];
    
    cell.textLabel.text = per.name;
    cell.imageView.image = [UIImage imageNamed:per.headImageName];
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //记录
    _selectNum = indexPath.row;
    
    ViewControllerB *ctl = [[ViewControllerB alloc] init];
    
    //ctl.receiveStr = [_dataArr[indexPath.row] name];
    
    Person *per = _dataArr[indexPath.row];
    ctl.receiveStr =  per.name;
    ctl.delegate = self;
    
    [self.navigationController pushViewController:ctl animated:YES];
    
}



@end
