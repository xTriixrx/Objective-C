//
//  main.m
//  NameOfComputer
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
        NSHost *host = [[NSHost alloc] init];
        NSString *hostname = [[NSString alloc] init];
        host = [NSHost currentHost];
        hostname = [host localizedName];
        NSLog(@"The local system name is: %@", hostname);
    }
    return 0;
}
