//
//  Solution.m
//  24. Swap Nodes in Pairs
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

//Given a linked list, swap every two adjacent nodes and return its head.
//
//For example,
//Given 1->2->3->4, you should return the list as 2->1->4->3.
//
//Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.




@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        
        LinkedNode *node1 = [[LinkedNode alloc] init];
        node1.value = 1;
        LinkedNode *node2 = [[LinkedNode alloc] init];
        node2.value = 2;
        LinkedNode *node3 = [[LinkedNode alloc] init];
        node3.value = 3;
        LinkedNode *node4 = [[LinkedNode alloc] init];
        node4.value = 4;
        LinkedNode *node5 = [[LinkedNode alloc] init];
        node5.value = 5;
        LinkedNode *node6 = [[LinkedNode alloc] init];
        node6.value = 6;
        
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        NSLog(@"Before");
        
        LinkedNode *head = node1;
        while (head != nil) {
            printf("%ld , ",head.value);
            head = head.next;
        }
        printf("\n");
        
        head = [self swapPair:node1];

        NSLog(@"After");
        while (head != nil) {
            printf("%ld , ",head.value);
            head = head.next;
        }
        printf("\n");

    }
    return self;
}

- (LinkedNode*)swapPair:(LinkedNode*)head{
    if (head == nil) {
        return nil;
    }
    
    LinkedNode *newHead = nil;
    
    LinkedNode *privousLast = nil;
    LinkedNode *last = nil;
    LinkedNode *current = head;
    NSInteger count = 0;
    while (current != nil) {
        if (count % 2 == 1) {
            last.next = current.next;
            current.next = last;
            privousLast.next = current;
            if (newHead == nil) {
                newHead = current;
            }
            count++;
            privousLast = current;
            current = last.next;
            continue;
        }
        count++;
        
        privousLast = last;
        last = current;
        current = current.next;
    }
    
    return newHead;
}

@end












