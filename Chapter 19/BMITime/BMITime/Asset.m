//
//  Asset.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Asset.h"

@implementation Asset

@synthesize label, resaleValue;

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%d >",
            [self label], [self resaleValue]];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
