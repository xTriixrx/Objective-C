//
//  main.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 17: Your First Class
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create an instance of Person
        Person *person = [[Person alloc] init];
        
        // Give the instance variables interesting values
        [person setWeightInKilos:96];
        [person setHeightInMeters:1.8];
        
        // Call the bodyMassIndex method
        float bmi = [person bodyMassIndex];
        NSLog(@"Person (%d, %f) has a BMI of %f",
              [person weightInKilos], [person heightInMeters], bmi);
    }
    return 0;
}
