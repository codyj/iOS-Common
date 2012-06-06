//
//  ViewController.m
//  iOS-Common
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize hexTextField;
@synthesize invalidHexValueLabel;
@synthesize colorPreviewView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.hexTextField becomeFirstResponder];
}

- (void)viewDidUnload {
    [self setHexTextField:nil];
    [self setInvalidHexValueLabel:nil];
    [self setColorPreviewView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)hexValueChanged:(id)sender {
    UIColor *color = [UIColor colorWithHexString:self.hexTextField.text];
    if (color) {
        self.invalidHexValueLabel.hidden = YES;
        self.colorPreviewView.backgroundColor = color;
    }
    else {
        self.invalidHexValueLabel.hidden = NO;
    }
}

@end
