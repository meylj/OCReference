//
//  ViewControllerA.m
//  UI-day12-表格视图的搜索功能
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;//数据数组
    NSMutableArray *_searchArr;//储存搜索结果的
    UISearchDisplayController *_disCtl;//必须作为成员变量
}

@end

@implementation ViewControllerA

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //实例化
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
    
    //实例化一个UISearchBar
    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _myTableView.tableHeaderView = bar;
    
    //contentsController搜索功能建立在哪个控制器上
    _disCtl = [[UISearchDisplayController alloc] initWithSearchBar:bar contentsController:self];
    
    //设置代理
    _disCtl.searchResultsDataSource = self;
    _disCtl.searchResultsDelegate = self;
    _disCtl.delegate = self;
    
    
    NSLog(@"_myTableView = %p",_myTableView);
    
    //读取数据
    [self loadData];
    
}

//加载数据
-(void)loadData{
    
    NSArray *arr = @[@"Baby",@"Boy",@"Girl",@"Woman",@"Man"];
    
    for (int i = 0; i< 5; i++) {
        
        for (int j = 0 ; j< 4; j++) {
            
            [_dataArr addObject:[NSString stringWithFormat:@"%@%d",arr[i],j]];
            
        }
        
    }
    
}


#pragma mark-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     NSLog(@"tableView = %p",tableView);
    
    //判断一下是哪一个tableView触发的代理方法
    if (tableView == _disCtl.searchResultsTableView) {
        
        return _searchArr.count;
    }
    
    
    return _dataArr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //复用形式实例化UITableViewCell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];//在队列里寻找cell
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    //不同的tableView显示不同的内容
    if (tableView == _disCtl.searchResultsTableView) {
        
        cell.textLabel.text = _searchArr[indexPath.row];
    }else{
        
        cell.textLabel.text = _dataArr[indexPath.row];
    }
    
    
    
    return cell;
    
}

//过滤搜寻结果
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    //清空数组
    [_searchArr removeAllObjects];
    
    NSLog(@"searchString = %@",searchString);
    
    for (NSString *str in _dataArr) {
        
        //查找
        if ([str rangeOfString:searchString].location!=NSNotFound) {
            //添加到搜索结果的数组里面d
            [_searchArr addObject:str];
            
        }
        
    }
    
    
    
    return YES;
}



@end
