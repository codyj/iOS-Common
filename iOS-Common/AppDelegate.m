//
//  AppDelegate.m
//  iOS-Common
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "SamplesListViewControllerViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize samplesListViewController;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.samplesListViewController = [[SamplesListViewControllerViewController alloc] initWithNibName:@"SamplesListViewControllerViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.samplesListViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
