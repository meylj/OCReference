//
//  ViewControllerB.h
//  UI-day13-XIB
//
//  Created by liufy on 15/3/18.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerB : UIViewController
//btn本身连线
@property (weak, nonatomic) IBOutlet UIButton *faceBtn;
//事件连线
- (IBAction)facebtnAction:(UIButton *)sender;





@end
