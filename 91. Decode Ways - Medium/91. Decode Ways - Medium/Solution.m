//
//  Solution.m
//  91. Decode Ways - Medium
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"Result of %@ : %ld", @"12", [self numDecodings:@"12"]);
        
        NSLog(@"Result of %@ : %ld", @"99999999",[self numDecodings:@"99999999"]);
        
        NSLog(@"Result of %@ : %ld", @"199999999",[self numDecodings:@"199999999"]);

        NSLog(@"Result of %@ : %ld", @"1111",[self numDecodings:@"1111"]);

    }
    
    return self;
}


- (NSInteger)numDecodings:(NSString*)string{
    
    return [self numDecodings:string withCounter:0 withIndex:string.length] + 1;
}

- (NSInteger)numDecodings:(NSString*)string withCounter:(NSUInteger)count withIndex:(NSInteger)index{
    
    if (string.length == 0 || index <= 0) {
        return count;
    }
    
    NSInteger counter = count;
    if (index >= 2) {
        NSString *substring = [string substringWithRange:NSMakeRange(index-1-1, 2)];
        if ([substring integerValue] <= 26) {
            counter++;
            counter = [self numDecodings:string withCounter:counter withIndex:index-1-1];
        }
    }

    counter = [self numDecodings:string withCounter:counter withIndex:index-1];
    
    return counter;
}



@end
