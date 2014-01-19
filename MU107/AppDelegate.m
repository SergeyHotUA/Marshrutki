//
//  AppDelegate.m
//  MU107
//
//  Created by Seregy on 1/18/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    LoginViewController* controllet = [[LoginViewController alloc] init];
    [controllet publicMethod];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{ }

- (void)applicationDidEnterBackground:(UIApplication *)application
{ }

- (void)applicationWillEnterForeground:(UIApplication *)application
{ }

- (void)applicationDidBecomeActive:(UIApplication *)application
{ }

- (void)applicationWillTerminate:(UIApplication *)application
{ }

@end
