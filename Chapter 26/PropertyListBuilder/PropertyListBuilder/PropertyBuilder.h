//
//  PropertyBuilder.h
//  PropertyListBuilder
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 26: Property Lists
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "c_numeric_validity.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString const *ARR;
extern NSString const *DICT;
extern NSString const *STR;
extern NSString const *DATA;
extern NSString const *DATE;
extern NSString const *INT;
extern NSString const *FLT;
extern NSString const *BOOLEAN;
extern NSString const *EXIT;
extern NSString const *PRINT;
extern NSString const *WRITE;

@interface PropertyBuilder : NSObject

+ (NSMutableArray *)setNSArrays:(NSMutableArray *)arrayContainer;
+ (NSMutableArray *)setNSDictionaries:(NSMutableArray *)dictContainer;
+ (NSMutableArray *)setNSStrings:(NSMutableArray *)strContainer;
+ (NSMutableArray *)setNSDatas:(NSMutableArray *)dataContainer;
+ (NSMutableArray *)setNSDates:(NSMutableArray *)dateContainer;
+ (NSMutableArray *)setIntegers:(NSMutableArray *)intContainer;
+ (NSMutableArray *)setFloats:(NSMutableArray *)floatContainer;
+ (NSMutableArray *)setBooleans:(NSMutableArray *)booleanContainer;
+ (int)dataTypeSwitch:(NSString *)s;

@end

NS_ASSUME_NONNULL_END
