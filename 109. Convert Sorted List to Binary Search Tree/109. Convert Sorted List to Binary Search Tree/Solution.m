//
//  Solution.m
//  109. Convert Sorted List to Binary Search Tree
//
//  Created by Peigen.Liu on 2017/9/20.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"
#import "BinaryTreeNode.h"
#import "LinkedNode.h"


//4.07

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        
        LinkedNode *head = [[LinkedNode alloc] init];
        head.value = 1;
        
        LinkedNode *lastNode = head;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i;
            
            lastNode.next = node;
            
            lastNode = node;
        }
        
        BinaryTreeNode *bstHead = [self sortLinkedNodeToBST:head withEnd:nil];
        NSLog(@"%@",[bstHead printTree]);
        
    }
    
    return self;
}

- (BinaryTreeNode*)sortLinkedNodeToBST:(LinkedNode*)head withEnd:(LinkedNode*)endNode{
    if (head == endNode) {
        return nil;
    }
    LinkedNode *fastRunner = head;
    LinkedNode *slowRunner = head;
    
    while (fastRunner != endNode && fastRunner.next != endNode) {
        fastRunner = fastRunner.next.next;
        slowRunner = slowRunner.next;
    }
    
    BinaryTreeNode *rootNode = [[BinaryTreeNode alloc] init];
    rootNode.value = slowRunner.value;
    rootNode.left = [self sortLinkedNodeToBST:head withEnd:slowRunner];
    rootNode.right = [self sortLinkedNodeToBST:slowRunner.next withEnd:endNode];
    
    
    return rootNode;
}

@end
