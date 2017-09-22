//
//  Solution.m
//  109. Convert Sorted List to Binary Search Tree
//
//  Created by Peigen.Liu on 2017/9/20.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"
#import "BinaryTreeNode.h"


//4.07

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        
        
        NSMutableArray<BinaryTreeNode*> *mArrayA = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0 ; i < 10; i++) {
            BinaryTreeNode *root = [[BinaryTreeNode alloc] init];
            root.value = i+1;
            [mArrayA addObject:root];
        }
        
        [mArrayA objectAtIndex:0].left = [mArrayA objectAtIndex:1];
        [mArrayA objectAtIndex:0].right = [mArrayA objectAtIndex:5];
        [mArrayA objectAtIndex:1].left = [mArrayA objectAtIndex:2];
        [mArrayA objectAtIndex:1].right = [mArrayA objectAtIndex:4];
        [mArrayA objectAtIndex:2].left = [mArrayA objectAtIndex:3];
        [mArrayA objectAtIndex:5].left = [mArrayA objectAtIndex:6];
        [mArrayA objectAtIndex:5].right = [mArrayA objectAtIndex:7];


        NSLog(@"%@",[[mArrayA objectAtIndex:0] printTree]);
        
        
        if (![self hasSumPath:[mArrayA objectAtIndex:0] SumValue:0 targetValue:10000]) {
            NSLog(@"Passed!");
        }
        
        if ([self hasSumPath:[mArrayA objectAtIndex:0] SumValue:0 targetValue:10]) {
            NSLog(@"Passed!");
        }
        
    }
    
    return self;
}


- (BOOL)hasSumPath:(BinaryTreeNode*)rootNode SumValue:(NSInteger)sum targetValue:(NSInteger)targetValue{
    
    if (rootNode == nil) {
        return NO;
    }
    
    sum += rootNode.value;
    if (sum == targetValue) {
        return YES;
    }
    
    return ([self hasSumPath:rootNode.left SumValue:sum targetValue:targetValue] ||  [self hasSumPath:rootNode.right SumValue:sum targetValue:targetValue]);
}

@end
