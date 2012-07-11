//
//  AppDelegate.h
//  iOS-Common
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SamplesListViewControllerViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SamplesListViewControllerViewController *samplesListViewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
