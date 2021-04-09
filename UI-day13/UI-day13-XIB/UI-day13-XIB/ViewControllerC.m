//
//  ViewControllerC.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerC.h"

@interface ViewControllerC ()<UITextFieldDelegate>

@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"textField正在的内容正在变化,textField.tag = %ld",textField.tag);
    
    return YES;
}


@end
