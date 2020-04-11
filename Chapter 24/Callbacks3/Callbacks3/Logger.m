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
/*
- (void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}
*/
- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed!");
}

@end
