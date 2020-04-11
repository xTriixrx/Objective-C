//
//  main.m
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 21: Collection Classes
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create an array of Employee objects
        // Can also use the message array instead of alloc/init.
        //      NSMutableArray *e = [NSMutableArray array];
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // Create a dictionary of executives
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for(int i = 0; i < 10; i++) {
            // Create an instance of Employee
            Employee *person = [[Employee alloc] init];
            
            // Give the instance variables interesting values
            [person setWeightInKilos:90+i];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmployeeID:i];
            
            // Put the employee in the employees array
            // When you add an object to an array, the array claims ownership of it.
            [employees addObject:person];
            
            // Is this the first employee?
            if(i == 0) {
                [executives setObject:person forKey:@"CEO"];
            }
            // Is this the second employee?
            if(i == 1) {
                [executives setObject:person forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // Create 10 assets
        for(int i = 0; i < 10; i++) {
            
            // Create an asset
            Asset *asset = [[Asset alloc] init];
            
            // Give it an interesting label
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            // Get a random number between 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            
            // Find that employee
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            // Assign the asset to the employee
            [randomEmployee addAssetsObject:asset];
            [allAssets addObject:asset];
        }
        
        
        // There are several ways to sort an array, but the most common is to use an array of sort descriptors.
        // A sort descriptor has the name of a property of the objects contained in the array and whether that
        // property should be sorted in ascending or descending order.
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"
                                                            ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID"
                                                             ascending:YES];
        
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        /*
         *  When Employee 5 is deallocated, any assets of this employee will
         *  remain because the allAssets array still has ownership. For the assets
         *  that were pointing to this employee, since the pointer holder is a weak
         *  reference, the pointer variable is zeroed, or set to nil.
         */
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        
        NSLog(@"Executives: %@", executives);
        executives = nil;
        
        // There is a class called NSPredicate. A predicate contains a statement that might
        // be true. NSMutableArray has a handy method for discarding all the objects that don't satisfy the predicate.
        //          - (void)filterUsingPredicate:(NSPredicate *)predicate;
        //NSArray has a method that creates a new array that contains all the objects that satisfy the predicate.
        //          - (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:
                                                    @"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        NSLog(@"Giving up ownership of array");
        allAssets = nil;
        employees = nil;
        
        // If you want a collection of C primitive types such as floats and ints, you must wrap them
        // in a object, such as NSNumber. NSValue can hold a pointer and some types of structs.
        NSMutableArray *numList = [[NSMutableArray alloc] init];
        [numList addObject:[NSNumber numberWithInt:4]];
        [numList addObject:[NSNumber numberWithFloat:5.6]];
        for(NSNumber *num in numList) {
            NSLog(@"C Primitive Number: %@", num);
        }
        
        // You are not allowed to add nil to any collection class discussed, so in order to represent "nullness"
        // use the class NSNull, there is exactly one instance of NSNull and it represents nothingness.
        NSMutableArray *hotel = [[NSMutableArray alloc] init];
        
        //Lobby on the ground floor
        [hotel addObject:@"lobby"];
        
        //Pool on the second floor
        [hotel addObject:@"pool"];
        
        // The third floor is being renovated.
        [hotel addObject:[NSNull null]];
        
        //Bedrooms on the fourth floor.
        [hotel addObject:@"bedrooms"];
        for(NSString *floor in hotel) {
            if(floor != [NSNull null]){
                NSLog(@"%@", floor);
            }
        }
    }
    
    return 0;
}
