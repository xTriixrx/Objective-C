//
//  Asset.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 21: Collection Classes
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, resaleValue, holder;

- (NSString *)description
{
    // Is holder non-nil?
    if([self holder]) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",
                [self label], [self resaleValue], [self holder]];
    }
    else {
        return [NSString stringWithFormat:@"<%@: $%d >",
                [self label], [self resaleValue]];
    }
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
