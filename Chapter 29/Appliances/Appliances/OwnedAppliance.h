//
//  OwnedAppliance.h
//  Appliances
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 29: init & Chapter 30: Properties
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Appliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface OwnedAppliance : Appliance
{
    NSMutableSet *ownerNames;
}

// The designated initializer
- (id)initWithProductName:(NSString *)pn
           firstOwnerName:(NSString *)n;
- (void)addOwnerNamesObject:(NSString *)n;
- (void)removeOwnerNamesObject:(NSString *)n;

@end

NS_ASSUME_NONNULL_END
