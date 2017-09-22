//
//  RandomizedCollection.h
//  381. Insert Delete GetRandom O(1) - Duplicates allowed
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomizedCollection : NSObject


- (BOOL)insert:(NSInteger)value;

- (BOOL)remove:(NSInteger)value;


- (NSInteger)getRandom;

@end
