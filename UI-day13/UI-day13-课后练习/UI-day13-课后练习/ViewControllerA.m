//
//  ViewControllerA.m
//  UI-day13-课后练习
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "Person.h"

@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
    NSMutableArray *_searchArr;
    UISearchDisplayController *_disCtl;//搜索控制器
    
}

@end

@implementation ViewControllerA


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        
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
    
    
    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _myTableView.tableHeaderView = bar;
    
    
    _disCtl = [[UISearchDisplayController alloc] initWithSearchBar:bar contentsController:self];
    _disCtl.searchResultsDelegate = self;
    _disCtl.searchResultsDataSource= self;
    _disCtl.delegate = self;
    
    [self loadData];
}

-(void)loadData{
    
    NSArray *arr = @[@"好友",@"黑名单"];
    
    
    for (int i = 0; i< 2; i++) {
        
        for (int j = 0; j< 3; j++) {
            
            Person *per= [[Person alloc] init];
            per.name = [NSString stringWithFormat:@"%@%d",arr[i],j];
            per.headImageName = [NSString stringWithFormat:@"21_%d.jpg",3*i+j+1];
            
            [_dataArr addObject:per];
        }
        
        
    }
    
}

#pragma mark-tableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView==_disCtl.searchResultsTableView) {
        
        return _searchArr.count;
    }
    
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Person *per = nil;
    if (tableView == _disCtl.searchResultsTableView) {
        
        per = _searchArr[indexPath.row];
        
    }else{
       per = _dataArr[indexPath.row];
        
    }
    
    cell.textLabel.text = per.name;
    cell.imageView.image = [UIImage imageNamed:per.headImageName];
    
    return cell;
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    //过滤结果加载数据模型
    [_searchArr removeAllObjects];
    
    for (Person *tempPer in _dataArr) {
        
        if ([tempPer.name rangeOfString:searchString].location!=NSNotFound) {
            
            [_searchArr addObject:tempPer];
            
        }
        
        
    }
    
    
    
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewControllerB *ctl = [[ViewControllerB alloc] init];
    
    if (tableView == _disCtl.searchResultsTableView) {
        
        //传参
        ctl.myModel = _searchArr[indexPath.row];
        
    }else{
        
        //传参
        ctl.myModel = _dataArr[indexPath.row];
    }
    
    
    
    [self.navigationController pushViewController:ctl animated:YES];
    
    
}


@end
