//
//  main.m
//  Constants
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 22: Constants
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

// #include and #import do essentially the same thing: request the preprocessor read a file and add it to its output. Usually, you are including
// a file of declarations (.h file) and those declarations are used by the compiler to understand the code it is compiling.
// The difference between #include and #import: #import ensures that the preprocessor only includes a file once, #include will allow you to include
// the same file many times. C programmers tend to use #include while Objective-C programmers use #import.
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // In literal NSString, use \u for arbitrary unicode chars
        NSLog(@"\u03c0 is %f", M_PI);
        // MAX  is a #define preprocessor directive that is written as:
        // #define MAX(A,B)     ((A) > (B) ? (A) : (B))
        // So the compiler sees the replaced MAX with this line.
        // When you use a #define to do function-like stuff this is called a macro.
        NSLog(@"%d is larger", MAX(10, 12));
        
        // NSLocale is a class that stores information about different geographical locations.
        // NSLocaleCurrencyCode is a global variable declared in NSLocale.h:
        //      extern NSString const *NSLocaleCurrencyCode;
        // extern means the definition is defined elsewhere (for the compiler to not complain) and
        // const makes the pointer stay unchanged for the entire life of the program.
        // In NSLocale.m, the definition is provided as such:
        //      NSString const *NSLocaleCurrencyCode = @"currency";
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode]; // or NSString *currency = [here objectForKey:@"currency"];
        NSLog(@"Money is %@", currency);
        
    }
    return 0;
}
