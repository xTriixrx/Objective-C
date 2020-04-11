//
//  main.m
//  Stringz
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 23: Writing Files with NSString and NSData
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *outstr = [[NSMutableString alloc] init];
        for(int i = 0; i < 10; i++) {
            [outstr appendString:@"This is cool!\n"];
        }
        
        // Declare a pointer to an NSError object, but don't instantiate it.
        // The NSError instance will only be created if there is, in fact, an error.
        // Do not try to access NSError unless the return value indicates one has
        // occured; if NSError object doesn't actually exist, accessing it will crash
        // the program.
        NSError *outerror = nil;
        
        // Pass the NSError pointer by reference to the NSString method
        bool success = [outstr writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&outerror];
        
        // Test the returned bool, and query the NSError if the write failed.
        if(success) {
            NSLog(@"Done writing to /tmp/cool.txt");
        }
        else {
            NSLog(@"Writing to /tmp/cool.txt failed: %@", [outerror localizedDescription]);
        }
        
        
        // Reading a file into a string is very similar:
        NSError *inerror = nil;
        NSString *instr = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                        encoding:NSASCIIStringEncoding
                                                           error:&inerror];
        if(!instr) {
            NSLog(@"Read failed: %@", [inerror localizedDescription]);
        }
        else {
            NSLog(@"/etc/resolv.conf looks like this: \n%@", instr);
        }
        
    }
    return 0;
}
