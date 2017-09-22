//
//  LinkedNode.h
//  24. Swap Nodes in Pairs
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedNode : NSObject

@property (nonatomic) NSInteger value;
@property (nonatomic,weak) LinkedNode *next;

@end
