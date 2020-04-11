//
//  main.m
//  ImageFetch
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 23: Writing Files with NSString and NSData
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SyncRequestSender.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // An NSData object represents a buffer of bytes. For example, if you fetch some data from a URL,
        // you can get an instance of NSData. And you can ask an NSData object to write itself to a file.
        
        NSURL *url = [NSURL URLWithString:
                      @"http://www.google.com/images/logos/ps_logo2.png"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        
        // Custom object that sends message to NSURLSession
        // This object was found on stackoverflow due to my lack of knowledge of Obj-C
        // and the library NSURLSession along with dispatch groups.
        NSData *data = [SyncRequestSender sendSynchronousRequest:request
                                               returningResponse:NULL
                                                           error:&error];
        
        if(!data) {
            NSLog(@"Fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes.", [data length]);
        
        bool written = [data writeToFile:@"/tmp/google.png"
                                 options:0
                                   error:&error];
        
        if(!written) {
            NSLog(@"Write failed: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", [readData length]);
    }
    return 0;
}
