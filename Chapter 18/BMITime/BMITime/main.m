//
//  main.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create an instance of Person
        // This is allowed because the Employee is also a person, however when using
        // a superclass as a pointer, you can only use the superclasses' methods. If
        // you need to use any of the subclasses' methods, the pointer must match it.
        //Person *person = [[Employee alloc] init];
        
        Employee *person = [[Employee alloc] init];
        
        // Give the instance variables interesting values
        [person setWeightInKilos:96];
        [person setHeightInMeters:1.8];
        [person setEmployeeID:15];
        
        // Call the bodyMassIndex method
        float bmi = [person bodyMassIndex];
        NSLog(@"Employee %d has a BMI of %f",
              [person employeeID], bmi);
        
    }
    return 0;
}
