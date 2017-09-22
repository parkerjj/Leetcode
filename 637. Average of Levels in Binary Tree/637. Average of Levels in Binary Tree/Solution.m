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


        NSLog(@"Tree \n %@",[[mArrayA objectAtIndex:0] printTree]);
        
        NSArray *averageArray = [self averageOfLevels:[mArrayA objectAtIndex:0]];
        NSLog(@"averageArray : %@",averageArray);
    }
    
    return self;
}

- (NSArray<NSNumber*> *)averageOfLevels:(BinaryTreeNode *)node{
    if (node == nil) {
        return nil;
    }
    
    NSMutableArray *valueLevelArray = [NSMutableArray array];
    
    NSMutableArray *queueA = [NSMutableArray array];
    NSMutableArray *queueB = [NSMutableArray array];

    NSUInteger level = 0;
    
    [queueA addObject:node];
    
    while ([queueA count] != 0) {
        while ([queueA count] != 0) {
            BinaryTreeNode *node = [queueA firstObject];
            [queueA removeObjectAtIndex:0];
            
            if ([valueLevelArray count] <= level) {
                NSMutableArray *valueOnLevel = [NSMutableArray array];
                [valueLevelArray addObject:valueOnLevel];
            }
            [[valueLevelArray objectAtIndex:level] addObject:[NSNumber numberWithInteger:node.value]];
            
            if (node.left != nil) {
                [queueB addObject:node.left];
            }
            if (node.right != nil) {
                [queueB addObject:node.right];
            }
            
        }
        level++;
        NSMutableArray *temp = queueA;
        queueA = queueB;
        queueB = temp;
    }
    
    
//    NSLog(@"%@",valueLevelArray);
    NSMutableArray *averageOfLevel = [NSMutableArray array];
    
    for (NSMutableArray *array in valueLevelArray){
        CGFloat sum = 0;
        for (NSNumber *number in array) {
            sum += number.integerValue;
        }
        [averageOfLevel addObject:[NSNumber numberWithDouble:sum/[array count]]];
    }
    
    
    return [NSArray arrayWithArray:averageOfLevel];
}


@end
