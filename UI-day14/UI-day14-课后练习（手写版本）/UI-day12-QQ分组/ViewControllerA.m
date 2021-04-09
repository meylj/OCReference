//
//  ViewControllerA.m
//  UI-day12-QQ分组
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "Person.h"
#import "Group.h"
#import "CustomView.h"
#import "CustomCell.h"

@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *_dataArr;//数据源
    NSMutableArray *_searchArr;//搜寻结果
    UITableView *_myTableView;
    UISearchDisplayController *_disCtl;//搜索
}

@end

@implementation ViewControllerA


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        _dataArr = [[NSMutableArray alloc] init];
        _searchArr = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [self.view addSubview:_myTableView];
    
    //添加搜索功能
    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _myTableView.tableHeaderView = bar;
    
    _disCtl = [[UISearchDisplayController alloc] initWithSearchBar:bar contentsController:self];
    
    _disCtl.searchResultsDelegate= self;
    _disCtl.searchResultsDataSource = self;
    _disCtl.delegate = self;
    

    
    [self loadData];
}

//加载数据
-(void)loadData{
    
    //加载组对象
    for (int i = 0; i<3; i++) {
        
        Group *groupModel = [[Group alloc] init];
        groupModel.groupName = [NSString stringWithFormat:@"好友列表%d",i];
        
        //加载人对象
        for (int j = 0; j <3 ; j++) {
            
            Person *perModel = [[Person alloc] init];
            perModel.name = [NSString stringWithFormat:@"好友%d",j];
            perModel.markStr = @"哈哈哈哈哈";
            perModel.headImageName = [NSString stringWithFormat:@"21_%d.jpg",3*i+j+1];
            //组对象的数组里面装人的对象
            [groupModel.perArr addObject:perModel];
            
        }
        //数据源数组装载组对象
        [_dataArr addObject:groupModel];
        
    }
    
    
}

//自定义view的点击事件
-(void)tapAction:(UIGestureRecognizer *)tap{
    
    //取到对应的组对象
    Group *groupModel = _dataArr[tap.view.tag-100];
    //是否展开状态取反
    groupModel.isOpen = !groupModel.isOpen;
    //刷新
    [_myTableView reloadData];
    
}


#pragma mark- UITableView代理方法
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _disCtl.searchResultsTableView) {
        
        
        return _searchArr.count;
    }
    
    //取到组对象
    Group *groupModel = _dataArr[section];
    
    //如果展开状态等于NO，就返回0行
    if (groupModel.isOpen == NO) {
        
        return 0;
    }
    
    return groupModel.perArr.count;
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (tableView == _disCtl.searchResultsTableView) {
        
        return 1;
    }
    
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //复用的形式创建cell
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
    }
    
    Person *perModel = nil;
    
    //判断是否是搜寻结果表格视图
    if (tableView == _disCtl.searchResultsTableView) {
        
        perModel = _searchArr[indexPath.row];
        
    }else{
        
        //取到组对象
        Group *groupModel = _dataArr[indexPath.section];
        //取到人对象
        perModel = groupModel.perArr[indexPath.row];
        
    }
    
    cell.nameLabel.text = perModel.name;
    cell.headImageView.image = [UIImage imageNamed:perModel.headImageName];
    cell.markLabel.text = perModel.markStr;
    
    
    return cell;
    
}
//设置组头名字
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    Group *groupModel = _dataArr[section];
//    
//    //设置组名
//    return groupModel.groupName;
//    
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //实例化自定义的头部视图
    CustomView *cusView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    Group *groupModel = _dataArr[section];
    
    //判断加载哪一个箭头
    if (groupModel.isOpen == YES) {
        
        cusView.tipView.image = [UIImage imageNamed:@"down"];
        
    }else{
        cusView.tipView.image = [UIImage imageNamed:@"right"];
        
    }
    
    
    //设置标题
    cusView.titleLab.text = groupModel.groupName;
    //打tag值
    cusView.tag = section+100;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [cusView addGestureRecognizer:tap];
    
    return cusView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 50;
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    [_searchArr removeAllObjects];
    
    
    for (Group *tempGroup in _dataArr) {
        
        
        for (Person *tempPer in tempGroup.perArr) {
            
            
            if ( [tempPer.name rangeOfString:searchString].location!=NSNotFound) {
                
                [_searchArr addObject:tempPer];
                
            }
           
            
        }
        
        
    }
    
    
    
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewControllerB *ctl = [[ViewControllerB alloc] init];
    
    if (tableView == _disCtl.searchResultsTableView) {
        
        ctl.myModel = _searchArr[indexPath.row];
        
    }else{
        
        Group *groupModel = _dataArr[indexPath.section];
        ctl.myModel = groupModel.perArr[indexPath.row];
        
    }
    
    [self.navigationController  pushViewController:ctl animated:YES];
    
}


@end
