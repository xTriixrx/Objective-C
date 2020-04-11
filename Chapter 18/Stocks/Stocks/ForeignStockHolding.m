//
//  ForeignStockHolding.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/19/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "ForeignStockHolding.h"

@implementation ForeignStockHolding

@synthesize conversionRate;

- (float)costInDollars
{
    if(conversionRate) {
    float parentCost = [super costInDollars];
    return parentCost * [self conversionRate];
    }
    else {
        return [super valueInDollars];
    }
}

- (float)valueInDollars
{
    if(conversionRate) {
    float parentValue = [super valueInDollars];
    return parentValue * [self conversionRate];
    }
    else {
        return [super valueInDollars];
    }
}

@end
