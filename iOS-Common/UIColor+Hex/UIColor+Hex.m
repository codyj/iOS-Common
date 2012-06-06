//
//  UIColor+Hex.m
//  somethingtosay
//
//  Created by Cody Jorgensen on 6/5/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWith8BitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha {
    return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:(alpha / 255.0f)];
}

+ (UIColor *)colorWithHex:(NSUInteger)hexInteger {
    NSUInteger red, green, blue;
    
    red = (hexInteger & 0xff0000) >> 16;
    green = (hexInteger & 0x00ff00) >> 8;
    blue = (hexInteger & 0x0000ff);
    
    return [UIColor colorWith8BitRed:red
                               green:green
                                blue:blue
                               alpha:255];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    // minimum length of 3 is required to be valid
    if ([hexString length] < 3) {
        return nil;
    }
    
    // normalize string
    if ([hexString characterAtIndex:0] == '#') {
        hexString = [hexString substringFromIndex:1];
    }
    else if ([[hexString substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"0x"]) {
        hexString = [hexString substringFromIndex:2];
    }
    
    // return nil for invalid strings
    NSCharacterSet *validHexCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
    if ([hexString rangeOfCharacterFromSet:[validHexCharacters invertedSet]].location != NSNotFound) {
        return nil;
    }
    
    // handle special case of repeating values
    if ([hexString length] == 3) {
        unichar red = [hexString characterAtIndex:0];
        unichar green = [hexString characterAtIndex:1];
        unichar blue = [hexString characterAtIndex:2];
        hexString = [NSString stringWithFormat:@"%c%c%c%c%c%c", red, red, green, green, blue, blue];
    }
    
    if ([hexString length] != 6) {
        return nil;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    
    NSUInteger hexInteger;
    [scanner scanHexInt:&hexInteger];
    return [UIColor colorWithHex:hexInteger];
}

@end
