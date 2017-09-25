//
//  Solution.m
//  15. 3Sum
//
//  Created by Peigen.Liu on 2017/9/25.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution


- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSLog(@"%@",[self threeSum:@[@-1, @0, @1, @2, @-1, @-4]]);
    }
    
    return self;
}


- (NSArray <NSArray <NSNumber*>*>*)threeSum:(NSArray *)nums{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    
    
    NSArray<NSNumber*> *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber  *obj1, NSNumber *obj2) {
        if (obj1 < obj2) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    for (NSNumber *targetValue in sortedNums) {
        NSInteger targetPointer = [sortedNums indexOfObject:targetValue];
        NSInteger leftPointer = 0;
        NSInteger rightPointer = [sortedNums count] - 1;
        
        while (leftPointer != rightPointer) {
            if (leftPointer == targetPointer) {
                leftPointer++;
                continue;
            }
            
            if (rightPointer == targetPointer) {
                rightPointer--;
                continue;
            }
            
            NSInteger leftValue = [[sortedNums objectAtIndex:leftPointer] integerValue];
            NSInteger rightValue = [[sortedNums objectAtIndex:rightPointer] integerValue];

            if (leftValue + rightValue < 0-[targetValue integerValue]) {
                leftPointer++;
            }else if (leftValue + rightValue > 0-[targetValue integerValue]){
                rightPointer--;
            }else{
                // Bingo
                NSArray *sortedAnwserArray = [@[[NSNumber numberWithInteger:leftValue],[NSNumber numberWithInteger:rightValue],targetValue] sortedArrayUsingComparator:^NSComparisonResult(NSNumber  *obj1, NSNumber *obj2) {
                    if (obj1 < obj2) {
                        return NSOrderedAscending;
                    }
                    return NSOrderedDescending;
                }];
                
                [mDic setObject:sortedAnwserArray forKey:[sortedAnwserArray description]];
                break;
            }
        }
    }
    
    
    return [mDic allValues];
}

@end
