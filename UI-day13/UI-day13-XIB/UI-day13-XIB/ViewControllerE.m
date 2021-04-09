//
//  ViewControllerE.m
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerE.h"

@interface ViewControllerE ()
//事件
- (IBAction)tempAction:(id)sender;
//UIStepper事件
- (IBAction)UIStepperAction:(UIStepper *)sender;


@end

@implementation ViewControllerE

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tempAction:(id)sender {
    
    if ([sender tag]==1) {
        NSLog(@"滑条");
    }else if([sender tag]==2){
        NSLog(@"分段控制器");
    }
    
    
}

- (IBAction)UIStepperAction:(UIStepper *)sender {
    
    NSLog(@"sender.stepValue = %f",sender.stepValue);
    NSLog(@"sender.value =%f",sender.value);
}
@end
