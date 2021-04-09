//
//  RootViewCtl.m
//  超级好吃饭店
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "RootViewCtl.h"
#import "CustomCell.h"
#import "FoodModel.h"


@interface RootViewCtl ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;//刷新的数组
}

@end

@implementation RootViewCtl

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //实例化
        _dataArr = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [_myTableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self loadData];
}
//加载数据
-(void)loadData{
    
    //粤菜
    NSString *str = @"白灼虾/鲫鱼豆腐汤/老火靓汤/烤乳猪/广州文昌鸡/烧鹅/白切鸡/香芋扣肉";
    
    NSArray *arr = [str componentsSeparatedByString:@"/"];

    for (int i = 0; i < arr.count; i++) {
        
        //创建数据
        FoodModel *foodModel = [FoodModel new];
        foodModel.foodName = arr[i];
        foodModel.foodImageViewName = [NSString stringWithFormat:@"1-%d.jpg",i+1];
        foodModel.priceStr = [NSString stringWithFormat:@"%d",arc4random()%100];
        foodModel.sellStr = [NSString stringWithFormat:@"%d",arc4random()%1000];
        
        [_dataArr addObject:foodModel];
        
    }
    
    
    
    
}


#pragma mark-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    FoodModel *model = _dataArr[indexPath.row];
    
    //刷新数据
    cell.foodNameLabel.text = model.foodName;
    cell.foodImageView.image = [UIImage imageNamed:model.foodImageViewName];
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.priceStr] ;
    cell.sellLabel.text = [NSString stringWithFormat:@"已售:%@",model.sellStr];
    
    return cell;
    
    
}


@end
