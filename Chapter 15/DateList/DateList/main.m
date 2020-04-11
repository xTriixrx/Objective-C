//
//  main.m
//  DateList
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 15: NSArray
//
//  Created by Vincent Nigro on 9/17/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        //Create an array containing all three (nil terminates the list)
        NSArray *dateList = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
        
        // How many dates are there?
        NSLog(@"There are %lu dates.", [dateList count]);
        
        //Print a couple
        NSLog(@"The first date is %@.", [dateList objectAtIndex:0]);
        NSLog(@"The third date is %@.", [dateList objectAtIndex:2]);
        
        // Arrays are ordered, and can access an item with the objectAtIndex method.
        // Thus, if you want to loop and process each item in the array ("or iterate over array"),
        // you can create a for-loop as such:
        
        NSUInteger dateCount = [dateList count];
        for(int i = 0; i < dateCount; i++) {
            NSDate *d = [dateList objectAtIndex:i];
            NSLog(@"Here is a date: %@", d);
        }
       
        // Or can do a for loop for iterating over arrays as such:
        for(NSDate *d in dateList) {
            NSLog(@"Here is a date part 2: %@", d);
        }
        // This type of loop is known as fast enumeration, and is extremely efficient in
        // stepping through the items in a list. However the only restriction with fast
        // enumeration is you may not add to or remove from the array while enumerating over it.
        
        // NSMutableArrays is a subclass of NSArray, and can add/remove pointers (objects) after
        // initialization (mutable).
        NSMutableArray *mutableDateList = [NSMutableArray array];
        [mutableDateList addObject:now];
        [mutableDateList addObject:tomorrow];
        // Put yesterday at the beginning of the list
        [mutableDateList insertObject:yesterday atIndex:0];
        
        for (NSDate *d in mutableDateList) {
            NSLog(@"Here is a mutable date: %@", d);
        }
        
        // Remove yesterday
        [mutableDateList removeObjectAtIndex:0];
        NSLog(@"Now the first mutable date is %@", [mutableDateList objectAtIndex:0]);
    }
    return 0;
}
