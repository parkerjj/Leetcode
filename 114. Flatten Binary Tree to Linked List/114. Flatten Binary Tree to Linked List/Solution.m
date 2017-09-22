//
//  Solution.m
//  114. Flatten Binary Tree to Linked List
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self){
        BinaryTreeNode *root = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *left1 = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *left11 = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *left1right1 = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *right1 = [[BinaryTreeNode alloc] init];
        BinaryTreeNode *right11 = [[BinaryTreeNode alloc] init];
        
        root.value = 1;
        left1.value = 2;
        left11.value = 3;
        left1right1.value = 4;
        right1.value = 5;
        right11.value = 6;
        
        root.left = left1;
        root.right = right1;
        left1.left = left11;
        left1.right = left1right1;
        right1.right = right11;
        
        [self flattenTree:root];
        
        NSLog(@"Done");
    }
    
    return self;
}


BinaryTreeNode *prvNode;

- (void)flattenTree:(BinaryTreeNode*)root{
    if (root == nil) {
        return;
    }
    
    [self flattenTree:root.right];
    [self flattenTree:root.left];
    root.right = prvNode;
    root.left = nil;
    prvNode = root;

}

@end
