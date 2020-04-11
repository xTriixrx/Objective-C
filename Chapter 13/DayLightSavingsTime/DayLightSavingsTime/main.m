//
//  main.m
//  DayLightSavingsTime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 13: More Messages
//
//  Created by Vincent Nigro on 9/16/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSTimeZone *zone = [[NSTimeZone alloc] init];
        zone = [NSTimeZone systemTimeZone];
        bool daylight = [zone isDaylightSavingTime];
        if(daylight)
            NSLog(@"It is daylight savings time!");
        else
            NSLog(@"It is not daylight savings time.");
    }
    return 0;
}
