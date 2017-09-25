//
//  Solution.m
//  Add to List 301. Remove Invalid Parentheses
//
//  Created by Peigen.Liu on 2017/9/25.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"


//Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
//
//Note: The input string may contain letters other than the parentheses ( and ).
//
//Examples:
//"()())()" -> ["()()()", "(())()"]
//"(a)())()" -> ["(a)()()", "(a())()"]
//")(" -> [""]


@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSLog(@"%@",[self removeInvalidParentheses:@"()())()"]);
        NSLog(@"%@",[self removeInvalidParentheses:@"(a)())()"]);
        NSLog(@"%@",[self removeInvalidParentheses:@"("]);
        NSLog(@"%@",[self removeInvalidParentheses:@"((((())))()()()((((()()))))))())))"]);
        NSLog(@"%@",[self removeInvalidParentheses:@"((((())))()()()((((()()))))))())))("]);

    }
    return self;
}



- (NSArray*)removeInvalidParentheses:(NSString*)string{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    NSInteger left = 0;
    NSInteger right = 0;
    if (string.length == 0) {
        return nil;
    }
    for (int i = 0; i < string.length; i++) {
        NSString *letterStr = [string substringWithRange:NSMakeRange(i, 1)];
        if ([letterStr isEqualToString:@"("]) {
            left++;
        }else if ([letterStr isEqualToString:@")"]){
            right++;
        }
    }
    
    NSString *letterNeedRemove;
    if (left < right) {
        letterNeedRemove = @")";
    }else if (left > right){
        letterNeedRemove = @"(";
    }else{
        return [NSArray arrayWithObject:string];
    }
    
    for (int i = 0; i<string.length; i++) {
        NSString *letterStr = [string substringWithRange:NSMakeRange(i, 1)];
        if ([letterStr isEqualToString:letterNeedRemove]) {
            NSString *substr1 = [string substringWithRange:NSMakeRange(0, i)];
            NSString *substr2 = i < string.length-1 ? [string substringFromIndex:i+1] : @"";
            NSString *newStr = [NSString stringWithFormat:@"%@%@",substr1,substr2];
            
            if (ABS(left - right) > 1) {
                NSArray *array = [self removeInvalidParentheses:newStr];
                if (array != nil) {
                    for (NSString *str in array) {
                        [mDic setObject:str forKey:str];
                    }
                }
            }else{
                if ([self isValidParentheses:newStr]) {
                    [mDic setObject:newStr forKey:newStr];
                }
            }
        }
    }
    
    
    
    NSArray *allKeys = [mDic allKeys];
    return [allKeys count] == 0 ? @[@""] : allKeys;
}


- (BOOL)isValidParentheses:(NSString*)string{
    
    NSInteger left = 0;
    NSInteger right = 0;
    if (string.length == 0) {
        return NO;
    }
    
    for (int i = 0; i < string.length; i++) {
        NSString *letterStr = [string substringWithRange:NSMakeRange(i, 1)];
        if ([letterStr isEqualToString:@"("]) {
            left++;
        }else if ([letterStr isEqualToString:@")"]){
            right++;
        }
        
        if (left < right) {
            return NO;
        }
    }
    
    
    return YES;
}

@end
