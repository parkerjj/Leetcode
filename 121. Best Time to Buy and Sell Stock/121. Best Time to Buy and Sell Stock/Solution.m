//
//  Solution.m
//  121. Best Time to Buy and Sell Stock
//
//  Created by Peigen.Liu on 2017/9/27.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    
    if (self) {
        int price[] = {7, 2, 5, 1, 6, 4 , 1};
        NSLog(@"Max Profit is %ld",[self maxProfit:price days:7]);
    }
    
    return self;
}

- (NSUInteger)maxProfit:(int [])prices days:(NSUInteger)days{
    
    int lowestPrice = INT_MAX;
    int highestPrice = -1;
    int profit = 0;

    for (int i = 0; i < days; i++) {
        int todayPrice = prices[i];
        
        if (todayPrice > highestPrice) {
            highestPrice = todayPrice;
            int tempProfit = highestPrice - lowestPrice;
            if (tempProfit > profit) {
                profit = tempProfit;
            }
        }
        
        if (todayPrice < lowestPrice) {
            lowestPrice = todayPrice;
            highestPrice = -1;
        }
    }
    return profit;
}

@end
