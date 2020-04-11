//
//  main.m
//  SecondsSinceAlive
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
        NSDate *now = [NSDate date];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1997];
        [comps setMonth:5];
        [comps setDay:12];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        
        double secondsSinceBirth = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"There has been a total of %f since my day of birth.", secondsSinceBirth);
    }
    return 0;
}
