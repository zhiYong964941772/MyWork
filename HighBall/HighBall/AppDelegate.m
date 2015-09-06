//
//  AppDelegate.m
//  HighBall
//
//  Created by imac on 15-4-22.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AppDelegate.h"
#import "coverViewController.h"
#import "BallTarBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark -
#pragma mark Application lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication]keyWindow].tintColor=[UIColor redColor];
    NSString *path = NSHomeDirectory();
    NSLog(@"%@",path);
    _manager = [[BMKMapManager alloc]init];
    BOOL ret = [_manager start:@"GPrNEMXru1rSp3WO1VaEiHbx" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];

    NSString *key = @"CFBundleVersion";
    NSString *CFBundleVersion  = [NSBundle mainBundle].infoDictionary[key];
    NSString *defaults = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    if ([CFBundleVersion isEqualToString:defaults]) {
        BallTarBarViewController *ball = [[BallTarBarViewController alloc]init];
        self.window.rootViewController = ball;

    }else{
    
    coverViewController *cover = [[coverViewController alloc]init];
        self.window.rootViewController=cover;}
    [[NSUserDefaults standardUserDefaults]setObject:CFBundleVersion forKey: @"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults]synchronize];
   
   
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [BMKMapView willBackGround];
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
    [BMKMapView didForeGround];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

@end
