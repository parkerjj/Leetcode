//
//  Solution.m
//  38. Count and Say
//
//  Created by Peigen.Liu on 2017/9/27.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        for (int i = 0; i < 15; i++) {
            NSLog(@"%@",[self countAndSay:i]);
        }
    }
    return self;
}


- (NSString*)countAndSay:(NSUInteger)count{
    if (count <= 0) {
        return nil;
    }
    NSString *sequence = @"1";
    
    for (int i = 0; i < count - 1; i++) {
        NSMutableString *mString = [NSMutableString string];
        NSString *lastSingleNum = [sequence substringWithRange:NSMakeRange(0, 1)];
        NSUInteger sameNumCount = 0;
        for (int j = 0; j < sequence.length; j++) {
            NSString *singleNum = [sequence substringWithRange:NSMakeRange(j, 1)];
            if ([singleNum isEqualToString:lastSingleNum]) {
                sameNumCount++;
            }else{
                [mString appendFormat:@"%ld%@",sameNumCount,lastSingleNum];
                lastSingleNum = singleNum;
                sameNumCount = 1;

            }
        }
        [mString appendFormat:@"%ld%@",sameNumCount,lastSingleNum];

        sequence = [mString copy];
    
    }
    
    return sequence;
}

@end
