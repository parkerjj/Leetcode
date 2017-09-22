//
//  Solution.h
//  56. Merge Intervals
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solution : NSObject

@end



@interface Interval : NSObject

@property (nonatomic) NSInteger start;
@property (nonatomic) NSInteger end;

- (instancetype)initWithStart:(NSInteger)start withEnd:(NSInteger)end;

@end
