//
//  Portfolio.h
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/20/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StockHolding;
@class ForeignStockHolding;

NS_ASSUME_NONNULL_BEGIN

@interface Portfolio : NSObject
{
    float curValue;
    NSMutableArray *stocks;
}
@property float curValue;
- (void)addStockHoldingObj:(StockHolding *)stock;
- (void)addForeignStockHoldingObj:(ForeignStockHolding *)stock;
- (float)portfolioEvaluation;
@end

NS_ASSUME_NONNULL_END
