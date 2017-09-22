//
//  Solution.m
//  381. Insert Delete GetRandom O(1) - Duplicates allowed
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        RandomizedCollection *collection = [[RandomizedCollection alloc] init];
        [collection insert:1];
        [collection insert:1];
        [collection insert:2];
        [collection getRandom];
        [collection remove:1];
        [collection getRandom];
        
    }
    return self;
}



@end
