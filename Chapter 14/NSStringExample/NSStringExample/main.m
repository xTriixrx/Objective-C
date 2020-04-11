//
//  main.m
//  NSStringExample
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 14: NSString
//
//  Created by Vincent Nigro on 9/17/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // String literal instance example...
        NSString *why = @"Why me?";
        NSLog(@"%@", why);
        
        // NSString instance can be created programmatically:
        NSString *x = [NSString stringWithFormat:@"The best number is %d", 5];
        NSLog(@"%@", x);
        // To get number of characters...
        NSUInteger charCount = [x length];
        NSLog(@"%lu", charCount);
        
        // String equality test:
        if([why isEqual:x])
            NSLog(@"%@ and %@ are equal", why, x);
        
        // The NSString class has many methods designed to make life easier. Plus, NSString
        // (which is based on the UNICODE standard) is exceedingly good at holding text from all
        // languages.
    }
    return 0;
}
