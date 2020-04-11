//
//  ForeignStockHolding.h
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 19: Object Instance Variables
//
//  Created by Vincent Nigro on 9/19/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForeignStockHolding : StockHolding
{
    float conversionRate;
}

@property float conversionRate;

@end

NS_ASSUME_NONNULL_END
