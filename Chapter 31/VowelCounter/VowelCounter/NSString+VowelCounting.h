//
//  NSString+VowelCounting.h
//  VowelCounter
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 31 Categories
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (VowelCounting)
- (int)vowelCount;
@end

NS_ASSUME_NONNULL_END
