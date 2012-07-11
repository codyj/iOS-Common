//
//  EmailValidatorSampleViewController.m
//  iOS-Common
//
//  Created by Cody Jorgensen on 7/11/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "EmailValidatorSampleViewController.h"

#import "NSString+EmailValidation.h"

@interface EmailValidatorSampleViewController ()

@end

@implementation EmailValidatorSampleViewController

@synthesize emailTextField;
@synthesize resultImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Email Validation"];
    [self.emailTextField becomeFirstResponder];
}

- (void)viewDidUnload {
    [self setEmailTextField:nil];
    [self setResultImageView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)emailAddressChanged:(id)sender {
    NSString *emailAddress = self.emailTextField.text;
    self.resultImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@valid_email", ([emailAddress isValidEmail] ? @"" : @"in")]];
}

@end
