//
//  main.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForeignStockHolding.h"
#import "Portfolio.h"

ForeignStockHolding * createStockHolding(float purchase, float current, int numShares);
ForeignStockHolding * createForeignStockHolding(float purchase, float current, int numShares, float conversion);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Portfolio *portfolio = [[Portfolio alloc] init];

        [portfolio addStockHoldingObj:createStockHolding(2.30, 4.50, 40)];
        [portfolio addStockHoldingObj:createStockHolding(12.19, 10.56, 90)];
        [portfolio addStockHoldingObj:createStockHolding(45.10, 49.51, 210)];
        [portfolio addForeignStockHoldingObj:createForeignStockHolding(2.30, 4.50, 40, 0.9)];
        [portfolio addForeignStockHoldingObj:createForeignStockHolding(12.19, 10.56, 90, 0.9)];
        [portfolio addForeignStockHoldingObj:createForeignStockHolding(45.10, 49.51, 210, 0.9)];
        
        NSLog(@"The total Portfolio Evaluation is: %f", [portfolio portfolioEvaluation]);

    }
    return 0;
}

// C function that creates and returns a ForeignStockHolding object
ForeignStockHolding * createStockHolding(float purchase, float current, int numShares) {
    ForeignStockHolding *s = [[ForeignStockHolding alloc] init];
    [s setPurchaseSharePrice:purchase];
    [s setCurrentSharePrice:current];
    [s setNumberOfShares:numShares];
    return s;
}

// C function that creates and returns a ForeignStockHolding object with a conversion factor.
ForeignStockHolding * createForeignStockHolding(float purchase, float current, int numShares, float conversion) {
    ForeignStockHolding *f = [[ForeignStockHolding alloc] init];
    [f setPurchaseSharePrice:purchase];
    [f setCurrentSharePrice:current];
    [f setNumberOfShares:numShares];
    [f setConversionRate:conversion];
    return f;
}
