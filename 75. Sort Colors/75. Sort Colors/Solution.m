//
//  Solution.m
//  75. Sort Colors
//
//  Created by Peigen.Liu on 2017/9/27.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        int nums[] = {1,2,0,0,0,2,1,2,1,1,0,1,2,2,0,1};
        [self sortedColors:nums numberOfCount:16];
        
        for (int i = 0; i < 16; i++) {
            printf(" %d",nums[i]);
            printf("\n");
        }
        
    }
    return self;
}


- (void)sortedColors:(int[])nums numberOfCount:(int)count{
    if (count <= 0) {
        return;
    }
    
    int leftPoint = 0;
    int rightPoint = count-1;
    
    int targetValue = 0;
    while (leftPoint < count) {
        if (leftPoint == rightPoint && leftPoint < count -1) {
            targetValue++;
            rightPoint = count-1;
//            for (int i = 0; i < 16; i++) {
//                printf(" %d",nums[i]);
//            }
            continue;
        }
        
        if (nums[leftPoint] == targetValue) {
            leftPoint++;
            continue;
        }
        
        if (nums[leftPoint] != targetValue && nums[rightPoint] == targetValue) {

            printf("\nExchange LeftPoint %d(Value:%d) with R %d(V:%d)\n",leftPoint,nums[leftPoint],rightPoint,nums[rightPoint]);
            
            int temp = nums[leftPoint];
            nums[leftPoint] = nums[rightPoint];
            nums[rightPoint] = temp;
            leftPoint++;
            

            continue;
        }else{
            rightPoint--;
        }
        

        
        
    }
}

@end
