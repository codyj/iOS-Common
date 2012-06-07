//
//  NSString+EmailValidation.m
//
//  Created by Charles Magahern on 8/4/11.
//  Copyright 2011 omegaHern. All rights reserved.
//

#import "NSString+EmailValidation.h"

@implementation NSString (EmailValidation)

- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
    return [emailTest evaluateWithObject:self];
}

@end
