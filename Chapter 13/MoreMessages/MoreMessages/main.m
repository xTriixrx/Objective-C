//
//  main.m
//  MoreMessages
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
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSUInteger day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                        inUnit:NSCalendarUnitMonth
                                       forDate:now];
        
        NSUInteger hour = [cal ordinalityOfUnit:NSCalendarUnitHour
                                         inUnit:NSCalendarUnitDay
                                        forDate:now];
        
        NSLog(@"This is day %lu and hour %lu of the month.", day, hour);
        
        
    }
    return 0;
}
