//
//  Logger.m
//  Callbacks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 24: Callbacks
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Logger.h"

@implementation Logger
// Implement some of the delegate methods from NSURLConnections' protocol.

// Called each time a chunk of data arrives
- (void)connection:(NSURLConnection *)connection
    didRecieveData:(NSData *)data
{
    NSLog(@"Received %lu bytes", [data length]);
    
    //Create a mutable data if it doesn't already exist
    if(!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    [incomingData appendData:data];
}

// Called when the last chunk has been processed.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData
                                             encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    NSLog(@"String has %lu characters", [string length]);
    
    // Uncomment the next line to see the entire fetched file
    // NSLog(@"The whole string is: \n%@", string);
}

// Called if the fetch fails
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    NSLog(@"Connection Failed: %@", [error localizedDescription]);
    incomingData = nil;
}

@end
