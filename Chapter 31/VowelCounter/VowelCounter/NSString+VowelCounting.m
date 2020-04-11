//
//  NSString+VowelCounting.m
//  VowelCounter
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 31 Categories
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "NSString+VowelCounting.h"

#import <AppKit/AppKit.h>


@implementation NSString (VowelCounting)
- (int)vowelCount
{
    NSCharacterSet *charSet =
        [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    
    NSUInteger count = [self length];
    int sum = 0;
    for (int i = 0; i < count; i++) {
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]) {
            sum++;
        }
    }
    return sum;
}
@end
