//
//  OwnedAppliance.m
//  Appliances
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 29: init & Chapter 30: Properties
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

- (id) initWithProductName:(NSString *)pn
            firstOwnerName:(NSString *)n
{
    // Call the superclass's initializer
    self = [super initWithProductName:pn];
    
    if (self) {
       // Make a set to hold owner names
        ownerNames = [[NSMutableSet alloc] init];
        
        // Is the first owner name non-nil?
        if(n) {
            [ownerNames addObject:n];
        }
    }
    // Return a pointer to the new object
    return self;
}

// This function is needed to be added in case a user calls this superclass
// initalizer for this class. However the init function is not necessary to
// create because since this is an object ob OwnedAppliance, when init is called
// with this class, it calls the init of Appliance which class the initWithProductName
// initalizer of this class.
- (id)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:@"Unknown"];
}

- (void)addOwnerNamesObject:(NSString *)n
{
    [ownerNames addObject:n];
}

- (void)removeOwnerNamesObject:(NSString *)n
{
    [ownerNames removeObject:n];
}

@end
