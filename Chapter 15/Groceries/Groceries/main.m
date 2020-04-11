//
//  main.m
//  Groceries
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 15: NSArray
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Part 1: Create Groceries Array and use fast enumeration to print list.
        NSMutableArray *groceries = [NSMutableArray array];
        [groceries addObject:@"Banana"]; // For the sake of less typing hardcoded NSString type
        [groceries addObject:@"Apple"]; // in real world this is bad practice and should be stored..
        for(NSString *str in groceries) {
            NSLog(@"%@", str);
        }
        
        // Part 2: Finds common proper names that are also regular words. This part uses the files
        // /usr/share/dict/propernames and /usr/share/dict/words
        // Note: Not sure if this can be done more efficiently... please let me know if there is
        // a more efficient way than what I came up with. This exercise says to use the
        // caseInsensitiveCompare method, however this forces this part to have big O of N^2.
        NSString *properString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        
        NSString *regularString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
        
        NSArray *properWords = [properString componentsSeparatedByString:@"\n"];
        NSArray *regularWords = [regularString componentsSeparatedByString:@"\n"];
        
        NSMutableArray *bothWords = [NSMutableArray array];
        for(NSString *p in properWords) {
            if([regularWords containsObject:p])
                [bothWords addObject:p];
        }
        int count = 1;
        for(NSString *both in bothWords) {
            NSLog(@"Word %d: %@", count++, both);
        }
    }
    return 0;
}
