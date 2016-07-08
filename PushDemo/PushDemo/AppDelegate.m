//
//  AppDelegate.m
//  PushDemo
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//接收到远端推送
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"userInfo:%@", userInfo);
    application.applicationIconBadgeNumber = 0;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //向用户申请授权
    UIUserNotificationSettings *seetings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound| UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil];
    [application registerUserNotificationSettings:seetings];
    //1.注册远程推送服务
    [application registerForRemoteNotifications];
    
//    launchOptions,启动原因
    NSDictionary *remoteNoti = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    //如果字典不为空,那么是通过远程推送的消息启动的应用
    if (remoteNoti){
        //to do 根据推送的内容,做相应的处理
        [application setApplicationIconBadgeNumber:0];
    }
    
    
    
    
    return YES;
}

//2.apns返回注册手机的device token
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"%@", deviceToken);
}

//注册远程推送失败,返回错误
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"%@", error);
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
