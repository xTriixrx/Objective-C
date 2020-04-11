//
//  main.m
//  Appliances
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 29: init & Chapter 30: Properties
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Appliance *a = [[Appliance alloc] init];
        NSLog(@"a is %@", a);
        // This method setValue:forKey: as defined in NSObject, will go look for a
        // setter method named setProductName:. If the object doesn't have a setProductName:
        // method, it will access the instance variable directly.
        [a setValue:@"Washing Machine" forKey:@"productName"];
        //[a setProductName:@"Washing Machine"];
       
        // key-value coding are designed to work with objects but some properties
        // hold a non-object type like an int or float.
        [a setValue:[NSNumber numberWithInt:240] forKey:@"voltage"];
        //[a setVoltage:240];
        NSLog(@"a is %@", a);
        
        NSLog(@"The product name is %@", [a valueForKey:@"productName"]);
    }
    return 0;
}

// 4 Rules for Objective-C programmers for writing initializers:

// 1: If a class has several initalizers, only one should do the real work. That
// method is known as the designated initializer. All other initializers should call
// either directly or indirectly, the designated initializer.

// 2: The designated initializer will call the superclass's designated initializer
// before initializing its instance variables.

// 3: If the designated initializer of your class has a different name than the designated
// initializer of its superclass, you must override the superclass's designated initializer
// so that it calls the new designated initializer.

// 4: If you have several initializers, clearly document which is the designated
// initializer in the header file.



// Deadly init methods
// Every once in a while, however, you can't safely override the superclass's designated initializer.
// Lets say that you are creating a subclass of NSObject called WallSafe, and its designated initializer
// is initWithSecretCode:. However, having a default value for secretCode is not secure enough for your
// application. This means that the pattern we have been using - overriding init to call the new class's
// designated initializer with default values - is not acceptable.

// An instance of WallSafe will still respond to an init message so someone still could easily do this:
// WallSafe *ws = [[WallSafe alloc] init];
// The best thing to do is to override the superclass's designated initalizer in a way that lets developers
// know that they have made a mistake and tells them how to fix it:

//- (id)init
//{
//    @throw [NSException exceptionWithName:@"WallSafeInitialization"
//                                   reason:@"Use initWithSecretCode, not init"
//                                 userInfo:nil];
//}


// Why is key-value coding interesting? Anytime a standard framework wants to push data into your objects,
// it will use setValue:forKey:. Anytime a standard framework wants to read data from your objects, it will
// use valueForKey:. For example, Core Data is a framework that makes it easy to save your objects to a SQLite
// database and then bring them back to life. It manipulates your custom data-bearing objects using key-value coding.
