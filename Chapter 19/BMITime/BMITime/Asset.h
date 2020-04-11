//
//  Asset.h
//  BMITime
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Asset : NSObject
{
    NSString *label;
    unsigned int resaleValue;
}
// Strong modifier means "This is a pointer to an
// object which I claim ownership to".
@property (strong) NSString *label;
@property unsigned int resaleValue;

@end

NS_ASSUME_NONNULL_END
