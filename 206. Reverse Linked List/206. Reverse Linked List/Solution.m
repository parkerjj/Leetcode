//
//  Solution.m
//  206. Reverse Linked List
//
//  Created by Peigen.Liu on 2017/9/25.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"
#import "LinkedNode.h"



//Reverse a singly linked list.


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
        
        LinkedNode *reversedHead = [self reverseLinkedList:head];
        while (reversedHead) {
            printf(" %ld",reversedHead.value);
            reversedHead = reversedHead.next;
        }
        printf("\n\n");
    }
    
    return self;
}


LinkedNode *newHead;
- (LinkedNode*)reverseLinkedList:(LinkedNode*)head{
    if (head.next.next != nil) {
        [self reverseLinkedList:head.next];
    }else{
        newHead = head.next;
    }
    head.next.next = head;
    head.next = nil;
    return newHead;
}

@end

















