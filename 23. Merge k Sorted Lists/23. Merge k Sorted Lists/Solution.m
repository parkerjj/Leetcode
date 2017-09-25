//
//  Solution.m
//  23. Merge k Sorted Lists
//
//  Created by Peigen.Liu on 2017/9/25.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"


//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
// O(nlogk)

@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:5];
        
        LinkedNode *head1 = [[LinkedNode alloc] init];
        head1.value = 1;
        LinkedNode *lastNode = head1;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i*3+5;
            lastNode.next = node;
            lastNode = node;
        }
        [mArray addObject:head1];
        
        LinkedNode *head2 = [[LinkedNode alloc] init];
        head2.value = 1;
        lastNode = head2;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i*5+3;
            lastNode.next = node;
            lastNode = node;
        }
        [mArray addObject:head2];
        
        
        LinkedNode *head3 = [[LinkedNode alloc] init];
        head3.value = 2;
        lastNode = head3;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i*7+3;
            lastNode.next = node;
            lastNode = node;
        }
        [mArray addObject:head3];
        
        
        LinkedNode *head4 = [[LinkedNode alloc] init];
        head4.value = 1;
        lastNode = head4;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i*7+13;
            lastNode.next = node;
            lastNode = node;
        }
        [mArray addObject:head4];
        
        
        LinkedNode *head5 = [[LinkedNode alloc] init];
        head5.value = 1;
        lastNode = head5;
        for (int i = 2; i < 10; i++) {
            LinkedNode *node = [[LinkedNode alloc] init];
            node.value = i*8+3;
            lastNode.next = node;
            lastNode = node;
        }
        [mArray addObject:head5];
        
        
        
        LinkedNode *mergedLinkNode = [self mergeKLists:mArray];
        while (mergedLinkNode.next) {
            printf(" %ld",mergedLinkNode.value);
            mergedLinkNode = mergedLinkNode.next;
        }
    }
    return self;
}

- (LinkedNode*)mergeKLists:(NSArray <LinkedNode*>*)lists{
    
    return [self partion:lists withStart:0 withEnd:[lists count]-1];
}

- (LinkedNode*)partion:(NSArray <LinkedNode*>*)lists withStart:(NSUInteger)start withEnd:(NSUInteger)end{
    if (start == end) {
        return [lists objectAtIndex:start];
    }
    if (start<end) {
        NSUInteger half = (start + end)/2;
        LinkedNode *node1 = [self partion:lists withStart:start withEnd:half];
        LinkedNode *node2 = [self partion:lists withStart:half+1 withEnd:end];
        return [self mergeWithLinkedNodeA:node1 withLinkedNodeB:node2];
    }
    
    return nil;
}


- (LinkedNode*)mergeWithLinkedNodeA:(LinkedNode*)nodeA withLinkedNodeB:(LinkedNode*)nodeB{
    if (nodeA == nil) {
        return nodeB;
    }
    if (nodeB == nil) {
        return nodeA;
    }
    
    if (nodeA.value < nodeB.value) {
        nodeA.next = [self mergeWithLinkedNodeA:nodeA.next withLinkedNodeB:nodeB];
        return nodeA;
    }else{
        nodeB.next = [self mergeWithLinkedNodeA:nodeA withLinkedNodeB:nodeB.next];
        return nodeB;
    }
    return nil;
}

@end












