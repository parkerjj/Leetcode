//
//  Solution.m
//  56. Merge Intervals
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSArray *startVal = @[@1,@2,@8,@15];
        NSArray *endVal = @[@3,@6,@10,@18];
        
        NSMutableArray *mIntervals = [NSMutableArray arrayWithCapacity:[startVal count]];
        for (int i = 0; i < [startVal count]; i++) {
            [mIntervals addObject:[[Interval alloc] initWithStart:[[startVal objectAtIndex:i] integerValue] withEnd:[[endVal objectAtIndex:i] integerValue]]];
        }

        NSArray *result = [self mergeArray:[NSArray arrayWithArray:mIntervals]];
        NSLog(@"Result %@",result);
    }
    
    return self;
}



- (NSArray<Interval*>*)mergeArray:(NSArray<Interval*>*)intervals{
    if (intervals == nil || [intervals count] == 0) {
        return nil;
    }
    NSArray<Interval*> *sortedArray = [intervals sortedArrayUsingComparator:^NSComparisonResult(Interval *obj1, Interval *obj2) {
        if (obj1.start == obj2.start) {
            return NSOrderedSame;
        }
        
        return obj1.start < obj2.start ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    NSInteger start = [sortedArray objectAtIndex:0].start;
    NSInteger end = [sortedArray objectAtIndex:0].end;
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for(Interval *interval in sortedArray){
        if (interval.start <= end) {
            end = MAX(end, interval.end);
        }else{
            [resultArray addObject:[[Interval alloc] initWithStart:start withEnd:end]];
            start = interval.start;
            end = interval.end;
        }
    }
    
    // Add Last Result
    [resultArray addObject:[[Interval alloc] initWithStart:start withEnd:end]];


    return resultArray;
}

@end






@implementation Interval

- (instancetype)initWithStart:(NSInteger)start withEnd:(NSInteger)end{
    self = [super init];
    if (self) {
        self.start = start;
        self.end = end;
    }
    
    return self;
}

- (NSString*)description{
    return [NSString stringWithFormat:@"[%ld - %ld]",_start,_end];
}

@end
