//
//  Solution.m
//  200. Number of Islands
//
//  Created by Peigen.Liu on 2017/9/26.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"


//Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.


@implementation Solution


- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSArray *grid = @[ [NSMutableArray arrayWithArray:@[@1,@1,@1,@1,@0]],
                           [NSMutableArray arrayWithArray:@[@1,@1,@0,@1,@0]],
                           [NSMutableArray arrayWithArray:@[@1,@1,@0,@0,@0]],
                           [NSMutableArray arrayWithArray:@[@0,@0,@0,@1,@1]]
                           ];
        
        NSLog(@"Number of Islands : %ld",[self numberOfIslands:grid]);
        
    }
    
    return self;
}


- (NSUInteger)numberOfIslands:(NSArray<NSMutableArray<NSNumber*>*>*)grid{
    
    NSUInteger count = 0;
    for (NSInteger y = 0; y < [grid count]; y++){
        NSMutableArray *lineArray = [grid objectAtIndex:y];
        for (NSInteger x = 0; x < [lineArray count]; x++) {
            count += [self sink:grid withPositionX:x withPositionY:y];
        }
    }
    
    
    return count;
}


- (NSUInteger)sink:(NSArray<NSMutableArray<NSNumber*>*>*)grid withPositionX:(NSInteger)x withPositionY:(NSInteger)y{

    if (x < 0 || y < 0 || y >= [grid count] || x >= [grid[y] count] || grid[y][x].integerValue == 0) {
        return 0;
    }
    [[grid objectAtIndex:y] setObject:@0 atIndexedSubscript:x];
    
    [self sink:grid withPositionX:x-1 withPositionY:y];
    [self sink:grid withPositionX:x+1 withPositionY:y];
    [self sink:grid withPositionX:x withPositionY:y-1];
    [self sink:grid withPositionX:x withPositionY:y+1];

    return 1;
}

@end
