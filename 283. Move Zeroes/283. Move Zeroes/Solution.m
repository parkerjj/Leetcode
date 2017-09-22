//
//  Solution.m
//  283. Move Zeroes
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"



//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
//Note:
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.



@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        int nums[] = {0,1,2,3,5,0,5,95,1,1};
        int arrayLength = sizeof(nums)/sizeof(nums[0]);

        [self moveZero:nums arrayLength:arrayLength];
    }
    
    return self;
}


- (void)moveZero:(int*)array arrayLength:(int)arrayLength{
    // Here maybe a bug if array is empty.
    
    for (int i = arrayLength-1; i >= 0; i--) {
        if (i < arrayLength-1 && array[i] == 0) {
            for (int j = i; j < arrayLength-1; j++) {
                array[j] = array[j+1];
                array[j+1] = 0;
            }
        }
    }
    
    
    NSLog(@" ==== 遍历数组 ====");
    for (int i = 0; i < arrayLength; i++) {
        printf("%d , ",array[i]);
    }
}


@end
