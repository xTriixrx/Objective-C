//
//  main.m
//  VowelMovement
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 32 Blocks
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);
typedef double (^divBlock)(double, double);

// Mac OS X 10.6 and iOS 4 introduced a new feature called blocks, which is just
// a chunk of code like a C function, but it can be passed around as data.
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create the array of strings to devowelize and a container for new ones
        NSArray *oldStrings = [NSArray arrayWithObjects:
                @"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi", nil];
        NSLog(@"old strings: %@", oldStrings);
        
        NSMutableArray *newStrings = [NSMutableArray array];
        
        // Create a list of characters that we'll remove from the string
        NSArray *vowels = [NSArray arrayWithObjects:
                           @"a", @"e", @"i", @"o", @"u", nil];
        
        // Although blocks look like functions, they can be stored in variables.
        // Like other variables, block variables are declared and then assigned values.
        
        // Declare the block variable
        //ArrayEnumerationBlock devowelizer;
        
        // Iterate over the array with our block
        // Passes block anonymously
        [oldStrings enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop) {
            
            NSRange yRange = [string rangeOfString:@"y"
                                           options:NSCaseInsensitiveSearch];
            
            // Did I find a y?
            if(yRange.location != NSNotFound) {
                *stop = YES; // Prevent further iterations
                return;     // Stop this iteration
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // Iterate over the array of vowels, replacing occurrences of each with
            // an empty string.
            for(NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [newStrings addObject:newString];
        }];
        
        NSLog(@"new strings: %@", newStrings);
        
        divBlock divider;
        divider = ^(double numerator, double denominator) {
            return numerator/denominator;
        };
        
        double quotient = divider(42.0, 12.5);
        NSLog(@"%f", quotient);
    }
    return 0;
}

// Like primitive variables, blocks are created and stored on the stack. That is, the block
// will be destroyed along with the stack frame when the function or method that created
// the block returns. Sometimes, however your block needs to live longer than that. For
// example, it could become an instance variable of an object. In this case you must copy
// your block from the stack to the heap.
// ArrayEnumerationBlock iVarDevowelizer = [devowelizer copy];
// Now a copy of the block exists on the heap, it is now a heap-based block instead of a
// stack-based block, and the new block variable is a pointer to the block.

// A heap-based block behaving like an object comes with some memory management issues:

// What about variables that are used with the block?

// A block typically uses other variables (both primitive and pointers to objects) within
// its code that were created outside of it. To make sure these external variables will be
// available for as long as the block need them, the variables are captured by the block
// when the copy is made.

// For primitive variables, this means the values are copied and stored as local variables
// within the block. For pointers, the block itself will keep a strong reference to any
// objects it references. That means that any objects referred to by the block are
// guaranteed to live at least as long as the block itself. (This is where the difference
// lies between blocks and function pointers).

// Can these strong references lead to retain cycles/circular references?

// Yes, the fix is the same, one of the references need to become a weak reference. To do
// this, declare a __weak pointer outside the block and then reference this pointer within
// the block instead.

// Can I change the variables that the block has copied?

// By default, the variables captured by a block are constant within the block, and you
// cannot change their values. Object pointer variables, for example are constant within
// the scope of the block. (Although you can still send the object messages that can
// change its contents, you cannot modify the pointer itself).

// Sometimes however, you want to be able to modify an external variable within a block. To
// do this, you must declare the external variable using the __block keyword. For instance,
// in the following code, you increment the external variable counter.

// __block int counter = 0;
// void (^counterBlock)() = ^{ counter++; };
//  ...
// counterBlock() Increments counter to 1
// counterBlock() Increments counter to 2
