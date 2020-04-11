//
//  main.m
//  Stocks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 17: Your First Class
//
//  Created by Vincent Nigro on 9/18/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *stocks = [NSMutableArray array];
        for(int i = 0; i < 3; i++){
            StockHolding *s = [[StockHolding alloc] init];
            if(i == 0) {
                [s setPurchaseSharePrice:2.30];
                [s setCurrentSharePrice:4.50];
                [s setNumberOfShares:40];
            }
            else if(i == 1) {
                [s setPurchaseSharePrice:12.19];
                [s setCurrentSharePrice:10.56];
                [s setNumberOfShares:90];
            }
            else {
                [s setPurchaseSharePrice:45.10];
                [s setCurrentSharePrice:49.51];
                [s setNumberOfShares:210];
            }
            [stocks addObject:s];
        }
        
        int stockCount = 1;
        for(StockHolding *stock in stocks) {
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
