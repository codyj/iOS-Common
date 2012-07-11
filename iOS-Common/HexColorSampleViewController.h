//
//  ViewController.h
//  iOS-Common
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HexColorSampleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *hexTextField;
@property (weak, nonatomic) IBOutlet UILabel *invalidHexValueLabel;
@property (weak, nonatomic) IBOutlet UIView *colorPreviewView;

- (IBAction)hexValueChanged:(id)sender;

@end
