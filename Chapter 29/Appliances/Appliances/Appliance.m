//
//  Appliance.m
//  Appliances
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 29: init & Chapter 30: Properties
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Appliance.h"

@implementation Appliance

@synthesize productName, voltage;

// New init function that takes a NSString parameter
// the original init function is never allowed to be passed
// a parameter.
- (id)initWithProductName:(NSString *)pn
{
    // Call the NSObject's init method
    self = [super init];
    
    // Did it return something non-nil?
    if(self) {
        
        // Set the product name
        [self setProductName:pn];
        
        // Give voltage a starting value
        [self setVoltage:120]; //same as voltage = 120;
        // unless setVoltage is explicitly doing more than just that.
    }
    
    // Return a pointer to the new object
    return self;
}

// Used in setting the default product name if unfamiliar user sets
// product name using default init function.
- (id)init
{
    return [self initWithProductName:@"Unknown"];
}

// Used for printing description of object during NSLog("%@");
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", productName, voltage];
}

@end
