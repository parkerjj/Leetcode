//
//  BinaryTreeNode.h
//  114. Flatten Binary Tree to Linked List
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject


- (NSString*) printTree;

@property (nonatomic,strong) BinaryTreeNode *left;
@property (nonatomic,strong) BinaryTreeNode *right;
@property (nonatomic) NSInteger value;


@end




@interface  NSMutableArray (QueueAdditions)
- (id) dequeue;
- (void) enqueue: (id)obj;
@end
