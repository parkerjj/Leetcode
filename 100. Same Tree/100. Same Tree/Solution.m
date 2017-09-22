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
        
        BOOL emptyBool = [self isSameTree:nil andB:nil];
        if (emptyBool) {
            NSLog(@"Empty Test Case Pass!");
        }else{
            NSLog(@"Empty Test Case Failed!!!");
        }
        
        
        
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
        
        
        
        NSMutableArray<BinaryTreeNode*> *mArrayB = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0 ; i < 10; i++) {
            BinaryTreeNode *root = [[BinaryTreeNode alloc] init];
            root.value = i+1;
            [mArrayB addObject:root];
        }
        
        [mArrayB objectAtIndex:0].left = [mArrayB objectAtIndex:1];
        [mArrayB objectAtIndex:0].right = [mArrayB objectAtIndex:5];
        [mArrayB objectAtIndex:1].left = [mArrayB objectAtIndex:2];
        [mArrayB objectAtIndex:1].right = [mArrayB objectAtIndex:4];
        [mArrayB objectAtIndex:2].right = [mArrayB objectAtIndex:3];
        [mArrayB objectAtIndex:5].left = [mArrayB objectAtIndex:6];
        [mArrayB objectAtIndex:5].right = [mArrayB objectAtIndex:7];

        
        BOOL testCase = [self isSameTree:[mArrayA objectAtIndex:0] andB:[mArrayB objectAtIndex:0]];
        if (testCase) {
            NSLog(@"Test Case Failed!!");
        }else{
            NSLog(@"Test Case Passed!!");
        }
        
        
        
    }
    
    return self;
}


- (BOOL)isSameTree:(BinaryTreeNode*)treeNodeA andB:(BinaryTreeNode*)treeNodeB{
    
    NSMutableString *strA = [[NSMutableString alloc] initWithString:@""];
    NSMutableString *strB = [[NSMutableString alloc] initWithString:@""];

    [self stringFromRootNode:treeNodeA originString:strA];
    [self stringFromRootNode:treeNodeB originString:strB];
    
    if ([strA isEqualToString:strB]) {
        return YES;
    }
    
    return NO;
}


- (void)stringFromRootNode:(BinaryTreeNode*)rootNode originString:(NSMutableString*)originString{
    if (rootNode == nil || originString == nil) {
        return;
    }
    
    [originString appendFormat:@"%ld",rootNode.value];
    if (rootNode.left != nil) {
        [originString appendString:@"L"];
    }
    if (rootNode.right != nil) {
        [originString appendString:@"R"];
    }
    // Node End
    [originString appendString:@"/"];

    [self stringFromRootNode:rootNode.left originString:originString];
    [self stringFromRootNode:rootNode.right originString:originString];
    
    
}

@end
