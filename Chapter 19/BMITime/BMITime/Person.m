//
//  Person.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Person.h"

@implementation Person
// In the case where accessor/mutator methods do not do anything special, you can tell the compiler
// to synthesize default accessor/mutator methods based on each @property declaration.
// The following line is equivalent to all the function definitions below it:
@synthesize heightInMeters, weightInKilos;
/*
- (float)heightInMeters
{
    return heightInMeters;
}

- (void)setHeightInMeters:(float)h
{
    heightInMeters = h;
}

- (int)weightInKilos
{
    return weightInKilos;
}

- (void)setWeightInKilos:(int)w
{
    weightInKilos = w;
}
*/
// The self pointer is used when an object wants to send a message to itself. Many Obj-C programmers
// are quite religious about accessor/mutator methods; they never read or write to an instance
// variable except using its accessor methods. This would be satisfied as follows rather than
// using the variables explicitly:
- (float)bodyMassIndex
{
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end
