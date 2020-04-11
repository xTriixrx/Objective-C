//
//  Person.h
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 20: Preventing Memory Leaks
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// The class Person inherits all the instance variables and methods defined by the class NSObject.
@interface Person : NSObject
{
    // It has two instance variables
    float heightInMeters;
    int weightInKilos;
}

// You will be able to set those instance variables using these accessor/mutator functions.
// In Objective-C, accessor (getter) methods don't include get in the name; just a naming convention.
/*
- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;
*/

// Apple has created a quick and simplified way to write accessor/mutator methods called properties.
// The following code is equivalent to the getters and setters defined above, just much less verbose.
@property float heightInMeters;
@property int weightInKilos;

// This method calculates the Body Mass Index
- (float)bodyMassIndex;
@end

NS_ASSUME_NONNULL_END
