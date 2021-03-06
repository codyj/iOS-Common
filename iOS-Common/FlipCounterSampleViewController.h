//
//  FlipCounterSampleViewController.h
//  iOS-Common
//
//  Created by Cody Jorgensen on 7/11/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPFlipCounterView;

@interface FlipCounterSampleViewController : UIViewController

@property (strong, nonatomic) IBOutlet GPFlipCounterView *flipCounter;

- (IBAction)stepperValueChanged:(id)sender;

@end
