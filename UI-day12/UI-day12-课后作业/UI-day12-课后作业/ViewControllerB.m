//
//  ViewControllerB.m
//  UI-day12-课后作业
//
//  Created by liufy on 15/3/17.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()<UITextFieldDelegate>
{
    UITextField *_nameTF;//名字输入框
}

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];

    _nameTF = [[UITextField alloc] initWithFrame:CGRectMake(50, 80, 200, 40)];
    _nameTF.delegate= self;
    _nameTF.text = _receiveStr;
    _nameTF.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:_nameTF];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    

}
//修改
-(void)change{
    
    if (_delegate && [_delegate respondsToSelector:@selector(receiveName:)]) {
        
        [_delegate receiveName:_nameTF.text];
        
    }
    
    
    
}



@end
