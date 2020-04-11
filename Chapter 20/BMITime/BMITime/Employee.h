//
//  Employee.h
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 20: Preventing Memory Leaks
//
//  Created by Vincent Nigro on 9/19/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
// This line is for the compiler, this means to the compiler "don't panic
// when you see this class in the file, there is a class called Asset".
// Using @class rather than #import ives the compiler less information, but
// makes the processing of this particular file faster. You can use @class
// in this file and other header files because the compiler doesn't need
// to know a lot to process a file of declarations.
@class Asset;

NS_ASSUME_NONNULL_BEGIN

@interface Employee : Person
{
    int employeeID;
    NSMutableArray *assets;
}
@property int employeeID;
- (void)addAssetsObject:(Asset *)a;
- (unsigned int)valueOfAssets;
@end

NS_ASSUME_NONNULL_END
