//
//  Solution.m
//  78. Subsets
//
//  Created by Peigen.Liu on 2017/9/26.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution


- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%@",[self subsets:@[@1,@2,@3]]);
        NSLog(@"%@",[self subsets:@[]]);

    }
    return self;
}

- (NSArray<NSArray<NSNumber*>*>*) subsets:(NSArray*)nums{
    NSMutableArray *ans = [NSMutableArray array];
    [ans addObject:[NSArray arrayWithArray:[nums copy]]];
    [self removeObjectInArray:nums LastRemoveIndex:0 WithRemoveCount:[nums count] SaveInArray:ans];
    
    return ans;
}

- (void)removeObjectInArray:(NSArray*)mArray LastRemoveIndex:(NSUInteger)lastIndex WithRemoveCount:(NSUInteger)count SaveInArray:(NSMutableArray*)ans{
    if (count == 0) {
        return;
    }
    
    for (NSUInteger i = lastIndex; i<[mArray count]; i++) {
        NSMutableArray *tempArray = [mArray mutableCopy];
        id lastRObj = [tempArray objectAtIndex:i];
        [tempArray removeObject:lastRObj];
        [ans addObject:[NSArray arrayWithArray:[tempArray copy]]];
        [self removeObjectInArray:tempArray LastRemoveIndex:i WithRemoveCount:count-1 SaveInArray:ans];
    }
}

@end
