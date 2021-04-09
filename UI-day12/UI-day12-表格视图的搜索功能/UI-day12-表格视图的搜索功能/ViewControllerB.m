//
//  ViewControllerB.m
//  UI-day12-表格视图的搜索功能
//
//  Created by ylj on 2019/3/5.
//  Copyright © 2019 liufy. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *dataArr;
    NSMutableArray *searchArr;
}
@end

@implementation ViewControllerB

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
        searchArr = [[NSMutableArray alloc] init];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
