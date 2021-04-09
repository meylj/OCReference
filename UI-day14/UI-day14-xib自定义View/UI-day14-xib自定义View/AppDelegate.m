//
//  AppDelegate.m
//  UI-day14-xib自定义View
//
//  Created by liufy on 15/3/19.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomSubView.h"
#import "MyLabel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //加载xib创建的自定义view
    //CustomSubView *cusView = [[CustomSubView alloc] initWithFrame:CGRectMake(0, 20, 180, 136)];
    
    //从nib文件里面加载自定义view
    CustomSubView *cusView = [[NSBundle mainBundle] loadNibNamed:@"CustomSubView" owner:self options:0][0];
    
    
    [self.window addSubview:cusView];
    
    //加载自定义的Label
    MyLabel *mylabel = [[[NSBundle mainBundle]loadNibNamed:@"MyLabel" owner:self options:0] lastObject];
    mylabel.center = self.window.center;
    
    [self.window addSubview:mylabel];
    
    
    return YES;
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
