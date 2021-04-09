//
//  AppDelegate.m
//  UI-day14-imageView动画
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //背景图片
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    bgView.image = [UIImage imageNamed:@"back.jpg"];
    [self.window addSubview:bgView];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (int i = 1; i< 19; i++) {
        //把图片全部放入数组里面
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"DOVE %d",i]]];
        
    }
    
    UIImageView *birdView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    //设置静态图片
    birdView.image = arr[0];
    //设置动态图片组
    birdView.animationImages = arr;
    //设置动画持续时间
    birdView.animationDuration = 1;
    //设置动画的重复次数，如果为0，就是无限循环
    birdView.animationRepeatCount = 0;
    //开启动画
    [birdView startAnimating];
    birdView.tag = 100;
    //停止动画
    //[birdView stopAnimating];
    
    [self.window addSubview:birdView];
    
    //第一次调用
    [self fly];
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(fly) userInfo:nil repeats:YES];
    
    
    return YES;
    
    
}

-(void)fly{
    
    UIImageView *birdView = (UIImageView *)[self.window viewWithTag:100];
    
    
    [UIView animateWithDuration:5 animations:^{
        
        birdView.center = CGPointMake(self.window.bounds.size.width-25, self.window.bounds.size.height-25);
        
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:5 animations:^{
            
            birdView.frame =CGRectMake(100, 100, 50, 50);
            
        }];
        
        
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
