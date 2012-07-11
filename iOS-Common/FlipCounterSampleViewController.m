//
//  FlipCounterSampleViewController.m
//  iOS-Common
//
//  Created by Cody Jorgensen on 7/11/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "FlipCounterSampleViewController.h"

#import "GPFlipCounterView.h"
#import <QuartzCore/QuartzCore.h>

@interface FlipCounterSampleViewController ()

@end

@implementation FlipCounterSampleViewController
@synthesize flipCounter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Flip Counter"];
    
    self.flipCounter.layer.cornerRadius = 10.0;
    self.flipCounter.layer.borderWidth = 4.0;
    self.flipCounter.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)viewDidUnload {
    [self setFlipCounter:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)stepperValueChanged:(id)sender {
    [self.flipCounter setCounterValue:[(UIStepper *)sender value]];
}

@end
