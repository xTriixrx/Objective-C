//
//  Appliance.h
//  Appliances
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 29: init & Chapter 30: Properties
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// By not creating an init for a subclass, it inherits the init
// from the super class and zeros out any instance variables that
// exist only in the sub class.
@interface Appliance : NSObject
{
    // Objective-C triva: When compiling for iOS or 64-bit Mac OS X programs, you
    // do not need to declare instance variables since @property/@synthesize calls
    // are sufficient to make the space for the data, but its best practice to do so
    // and have compatibility for 32-bit Mac OS X systems.
    NSString *productName;
    int voltage;
}
// Propertys can be set to (readwrite) or (readonly) which means either creating a
// setter and getter method or only creating a getter, respectively.
// A property can also be declared unsafe_unretained, strong, weak, and copy. This option
// determines how the setter is handled its memory management.
//
// unsafe_unretained just assigns the passed-in value to the property, and is implicitly set
// to properties that hold non-objects such as voltage.

// strong ensures a strong reference (ownership) is kept to the passed-in object. It will also
// let go of ownership of the old object (which will then deallocate itself if it has no other
// owners). For properties that hold objects, you will usually use strong.

// weak does not imply ownership of the object pointed to. It will synthesize a setter that sets
// the property to the passed-in object. If this object is deallocated, the property will be set
// to nil. (Note that if the pointer is unsafe_unretained and the object it points to is deallocated
// you will have a "dangling pointer". Sending a message to a dangling pointer usually crashes your program).

// copy makes a copy of an object and then changes the pointer to refer to this copy. Use of copy attributes
// are most common with object types that have mutable subclasses.

// atomic and nonatomic options relate to multithreading options, nonatomic makes setters run a bit faster however, =
// all properties are by default atomic.
@property (copy) NSString *productName;
@property int voltage;

// The designated initializer
- (id)initWithProductName:(NSString *)pn;

@end

NS_ASSUME_NONNULL_END
