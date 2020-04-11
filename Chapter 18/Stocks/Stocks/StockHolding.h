//
//  StockHolding.h
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StockHolding : NSObject
{
    float purchaseSharePrice;
    float currentSharePrice;
    int numberOfShares;
}

@property float purchaseSharePrice;
@property float currentSharePrice;
@property int numberOfShares;
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; //currentSharePrice * numberOfShares
@end

NS_ASSUME_NONNULL_END
