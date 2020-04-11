//
//  main.m
//  VowelCounter
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 31 Categories
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello World!";
        NSLog(@"%@ has %d vowels.", string, [string vowelCount]);
    }
    return 0;
}
