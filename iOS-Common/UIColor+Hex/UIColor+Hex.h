//
//  UIColor+Hex.h
//  somethingtosay
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWith8BitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha;
+ (UIColor *)colorWithHex:(NSUInteger)hexInteger;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
