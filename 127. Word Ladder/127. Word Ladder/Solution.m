//
//  Solution.m
//  127. Word Ladder
//
//  Created by Peigen.Liu on 2017/9/21.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution


- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSLog(@"%ld",[self ladderLength:@"hit" endWord:@"zog" wordList:@[@"hot",@"dot",@"dog",@"lot",@"log",@"cog",@"zog"]]);
        
        
        
        NSLog(@"%ld",[self ladderLength:@"joy" endWord:@"put" wordList:@[@"joe",@"jey",@"pet",@"doy",@"zoe",@"zot",@"loy",@"pug",@"zut",@"cut",@"put"]]);

    }
    
    return self;
}



- (NSInteger)ladderLength:(NSString*)startword endWord:(NSString*)endWord wordList:(NSArray*)wordList{
    if (startword.length == 0 || endWord.length == 0 || [wordList count] == 0) {
        return 0;
    }
    
    
    NSMutableSet *startSet = [NSMutableSet set];
    NSMutableSet *endSet = [NSMutableSet set];
    
    [startSet addObject:startword];
    
    NSUInteger ladderLength = 1;
    
    
    NSMutableSet *wordSet = [NSMutableSet setWithArray:wordList];
    [wordSet minusSet:startSet];
    
    while ([startSet count] != 0) {
        ladderLength++;


        
        while ([startSet count] != 0) {
            NSString *str = [startSet anyObject];
            [startSet removeObject:str];
            NSSet *newSet = [self getOneEditedStringInSet:wordSet withOriginString:str];
            NSLog(@"From %@ To %@  Length is %ld",str,newSet,ladderLength);
            if ([newSet containsObject:endWord]) {
                return ladderLength+1;
            }
            
            [endSet unionSet:newSet];
            [wordSet minusSet:endSet];
            [wordSet minusSet:[NSSet setWithObject:str]];
        }

        
        NSMutableSet *temp = startSet;
        startSet = endSet;
        endSet = temp;

    }
    
    return 0;
}


- (NSSet*)getOneEditedStringInSet:(NSSet*)wordSet withOriginString:(NSString*)originString{
    if ([wordSet count] == 0 || originString.length == 0) {
        return nil;
    }
    
    NSMutableArray *stringInList = [NSMutableArray array];
    for (int i = 0 ; i < 26; i++) {
        for (int j = 0; j < originString.length; j++) {
            NSString *editedStr = [originString stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:[NSString stringWithFormat:@"%c",'a'+i]];
            if ([wordSet containsObject:editedStr] && ![editedStr isEqualToString:originString]) {
                [stringInList addObject:editedStr];
            }
        }
    }
    
    return [stringInList count] > 0 ? [NSSet setWithArray:stringInList] : nil;
}


@end
