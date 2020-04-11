//
//  Asset.h
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 20: Preventing Memory Leaks
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

NS_ASSUME_NONNULL_BEGIN

@interface Asset : NSObject
{
    NSString *label;
    __weak Employee *holder;
    unsigned int resaleValue;
}
// Strong modifier means "This is a pointer to an
// object which I claim ownership to".
@property (strong) NSString *label;
// A retain cycle is circular dependancy of ownership between
// objects which causes issues during deallocation. The rule of
// thumb is parent objects should have ownership of children but
// children should not be able to own the parent.
// They weak keyword is used for this situation.
@property (weak) Employee *holder;
@property unsigned int resaleValue;

@end

NS_ASSUME_NONNULL_END
