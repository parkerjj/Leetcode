//
//  RandomizedCollection.m
//  381. Insert Delete GetRandom O(1) - Duplicates allowed
//
//  Created by Peigen.Liu on 2017/9/22.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "RandomizedCollection.h"

@interface RandomizedCollection(){
    NSMutableArray *_array;
    NSMutableDictionary *_dictionary;
    
}

@end

@implementation RandomizedCollection


- (instancetype)init{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        _dictionary = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (BOOL)insert:(NSInteger)value{
    NSNumber *number = [NSNumber numberWithInteger:value];

    BOOL hasValue = [_dictionary objectForKey:number] != nil;
    
    [_array addObject:number];
    
    NSMutableArray *mArray;
    if (!hasValue) {
        mArray = [NSMutableArray array];
        [_dictionary setObject:mArray forKey:number];
    }else{
        mArray = [_dictionary objectForKey:number];
    }
    [mArray addObject:[NSNumber numberWithInteger:[_array indexOfObject:number]]];
    
    return hasValue;
}

- (BOOL)remove:(NSInteger)value{
    NSNumber *number = [NSNumber numberWithInteger:value];
    BOOL hasValue = [_dictionary objectForKey:number] != nil;
    if (!hasValue) {
        return NO;
    }
    
    NSMutableArray *mArray = [_dictionary objectForKey:number];
    if ([mArray count] == 0) {
        return NO;
    }
    NSNumber *indexInArray = [mArray firstObject];
    
    
    
    return YES;

}


- (NSInteger)getRandom{
    
    return NSNotFound;
}


@end
