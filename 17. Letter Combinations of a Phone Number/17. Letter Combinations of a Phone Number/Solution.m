//
//  Solution.m
//  17. Letter Combinations of a Phone Number
//
//  Created by Peigen.Liu on 2017/9/18.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"




//Given a digit string, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below.
//
//
//
//Input:Digit string "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//Although the above answer is in lexicographical order, your answer could be in any order you want.



@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%@",[self runWithDigits:@"234"]);
    }
    
    return self;
}


#define KEYS @[@" ",@"",@"abc",@"def",@"ghi",@"jkl",@"mno",@"pqrs",@"tuv",@"wxyz"]
- (NSArray *)runWithDigits:(NSString *)digits{
    NSMutableArray *digits2LettersArray = [NSMutableArray arrayWithCapacity:digits.length];
    for (int i = 0; i < digits.length ; i++) {
        [digits2LettersArray addObject:[KEYS objectAtIndex:[digits characterAtIndex:i] - '0']];
    }
    
    NSMutableArray *ansArray = [NSMutableArray arrayWithObject:@""];
    for (NSString *letterString in digits2LettersArray) {
        ansArray = [self expendArray:ansArray withLettersArray: letterString];
    }
    
    return ansArray;
}


- (NSMutableArray *)expendArray:(NSArray*)originArray withLettersArray:(NSString*)lettersArray{
    NSMutableArray *retArray = [NSMutableArray arrayWithCapacity:[originArray count]*4];
    
    for (int i = 0; i < lettersArray.length ; i++){
        for (NSString *str in originArray) {
            [retArray addObject:[str stringByAppendingFormat:@"%c",[lettersArray characterAtIndex:i]]];
        }
    }
    
    return retArray;
}

@end
