//
//  Portfolio.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Portfolio.h"
#import "ForeignStockHolding.h"

@implementation Portfolio

@synthesize curValue;

- (void)addStockHoldingObj:(StockHolding *)stock
{
    if(!stocks) {
        stocks = [[NSMutableArray alloc] init];
    }
    [stocks addObject:stock];
}

- (void)addForeignStockHoldingObj:(ForeignStockHolding *)stock
{
    if(!stocks) {
        stocks = [[NSMutableArray alloc] init];
    }
    [stocks addObject:stock];
}

- (float)portfolioEvaluation
{
    if(stocks) {
        for(ForeignStockHolding *stock in stocks) {
            [self setCurValue:[stock valueInDollars] + [self curValue]];
        }
    }
    return [self curValue];
}

@end
