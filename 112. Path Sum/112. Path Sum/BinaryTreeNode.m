//
//  BinaryTreeNode.m
//  114. Flatten Binary Tree to Linked List
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

- (NSString*) printTree{
    
    if (self == nil){
        return @"";
    }
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:self];
    [queue addObject:[NSNull null]];
    while (true){
        BinaryTreeNode *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]){
            [result appendString:@"\n"];
            
            if ([queue count] == 0){
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }
        [result appendString:[NSString stringWithFormat:@"%ld",curObject.value]];
        
        if (curObject.left){
            [queue enqueue:curObject.left];
        }
        if (curObject.right){
            [queue enqueue:curObject.right];
        }
    }
    
    return result;
}



@end

@implementation  NSMutableArray (QueueAdditions)

- (id) dequeue {
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
    }
    return headObject;
}

- (void) enqueue:(id)obj{
    [self addObject:obj];
}
@end
