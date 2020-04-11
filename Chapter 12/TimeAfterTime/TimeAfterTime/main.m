//
//  main.m
//  TimeAfterTime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 12: Objects
//
//  Created by Vincent Nigro on 9/16/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *now = [NSDate date];
        NSLog(@"The new date lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        // The id keyword allows a way to create a pointer without knowing exactly what kind of object
        // the pointer will refer to. For this case, we use the type id to mean "a pointer to some kind
        // of Objective-C object". Notice that there is not astrisk in this declaration, id implies the
        // astrisk.
        // id delegate = * ANY TYPE HERE *
    }
    return 0;
}
