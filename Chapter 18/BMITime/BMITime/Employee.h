//
//  Employee.h
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/19/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee : Person
{
    int employeeID;
}
@property int employeeID;
@end

NS_ASSUME_NONNULL_END
