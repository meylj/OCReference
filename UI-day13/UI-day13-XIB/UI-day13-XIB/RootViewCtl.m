//
//  RootViewCtl.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "RootViewCtl.h"
#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "ViewControllerD.h"
#import "ViewControllerE.h"
#import "ViewControllerF.h"
#import "ViewControllerG.h"

@interface RootViewCtl ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
}

@end

@implementation RootViewCtl

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        _dataArr = [@[@"UILabel",@"UIButton",@"UITextField",@"UIImageView",@"常用控件",@"UISrollView",@"UITableView"] mutableCopy];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [self.view addSubview:_myTableView];
    

}

#pragma mark- tableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = _dataArr[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //切换到各个控制视图
    switch (indexPath.row) {
        case 0:{
            
            ViewControllerA *ctl = [[ViewControllerA alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
            
        }
            
            break;
        case 1:{
            
            ViewControllerB *ctl = [[ViewControllerB alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
        }
            break;
        case 2:{
            ViewControllerC *ctl = [[ViewControllerC alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
            
            
        }
            break;
        case 3:{
            ViewControllerD *ctl = [[ViewControllerD alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
            
        }
            break;
        case 4:{
            ViewControllerE *ctl = [[ViewControllerE alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
        }
            break;
        case 5:{
            
            ViewControllerF *ctl = [[ViewControllerF alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
            
        }
            break;
        case 6:{
            ViewControllerG* ctl = [[ViewControllerG alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    
}



@end
