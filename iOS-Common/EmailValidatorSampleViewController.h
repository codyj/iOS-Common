//
//  EmailValidatorSampleViewController.h
//  iOS-Common
//
//  Created by Cody Jorgensen on 7/11/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailValidatorSampleViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UIImageView *resultImageView;

- (IBAction)emailAddressChanged:(id)sender;

@end
