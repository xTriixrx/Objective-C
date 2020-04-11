//
//  main.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 18: Inheritance
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForeignStockHolding.h"

ForeignStockHolding * createStockHolding(float purchase, float current, int numShares);
ForeignStockHolding * createForeignStockHolding(float purchase, float current, int numShares, float conversion);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *stocks = [NSMutableArray array];

        [stocks addObject:createStockHolding(2.30, 4.50, 40)];
        [stocks addObject:createStockHolding(12.19, 10.56, 90)];
        [stocks addObject:createStockHolding(45.10, 49.51, 210)];
        [stocks addObject:createForeignStockHolding(2.30, 4.50, 40, 0.9)];
        [stocks addObject:createForeignStockHolding(12.19, 10.56, 90, 0.9)];
        [stocks addObject:createForeignStockHolding(45.10, 49.51, 210, 0.9)];
        
        int stockCount = 1;
        for(ForeignStockHolding *stock in stocks) {
            NSLog(@"Stock Holding %d:", stockCount);
            NSLog(@"\tThe original purchase price for one stock: %f", [stock purchaseSharePrice]);
            NSLog(@"\tThe new purchase price for one position: %f", [stock currentSharePrice]);
            NSLog(@"\tThe number of shares for Stock Holding %d: %d" ,stockCount++, [stock numberOfShares]);
            NSLog(@"\tThe original cost in total was: %f", [stock costInDollars]);
            NSLog(@"\tThe new price in total is now: %f", [stock valueInDollars]);
            NSLog(@"\n");
        }

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
