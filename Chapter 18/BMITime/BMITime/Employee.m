//
//  Employee.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/19/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize employeeID;

// Overriding methods
// You can override inherited methods with a custom implementation.
// When overriding an inherited method, you need not to declare it
// in the header b/c they advertise the method so instances of other
// classes can call it.
- (float)bodyMassIndex
{
    // run this method by start the search for its implementation at my superclass.
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}
@end
