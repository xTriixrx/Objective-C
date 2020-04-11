//
//  StockHolding.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "StockHolding.h"

@implementation StockHolding
@synthesize purchaseSharePrice, currentSharePrice, numberOfShares;

- (float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares];
}
@end
