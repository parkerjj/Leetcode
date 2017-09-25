//
//  Solution.m
//  67. Add Binary
//
//  Created by Peigen.Liu on 2017/9/25.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"

@implementation Solution

//Given two binary strings, return their sum (also a binary string).
//
//For example,
//a = "11"
//b = "1"
//Return "100".


- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSLog(@"%@",[self addBinaryStringA:@"11" andStringB:@"1"]);
        
        NSLog(@"%@",[self addBinaryStringA:@"11100010100010101000111" andStringB:@"010001001110000101000101011111011111"]);

    }
    
    return self;
}

- (NSString*)addBinaryStringA:(NSString*)strA andStringB:(NSString*)strB{
    
    NSMutableString *retStr = [NSMutableString string];
    NSString *longestStr = strA.length < strB.length ? strB : strA;
    
    NSUInteger carry = 0;
    for (int i = 0; i < longestStr.length; i++) {
        NSUInteger sum = carry;
        NSUInteger numA = (NSInteger)(strA.length -1 -i) >= 0 ? [[strA substringWithRange:NSMakeRange(strA.length-1-i, 1)] integerValue] : 0;
        NSUInteger numB = (NSInteger)(strB.length -1 -i) >= 0 ? [[strB substringWithRange:NSMakeRange(strB.length-1-i, 1)] integerValue] : 0;
        sum += numA;
        sum += numB;
        carry = sum/2;
        [retStr insertString:[NSString stringWithFormat:@"%ld",sum%2] atIndex:0];
    }
    
    // Add Carray
    [retStr insertString:[NSString stringWithFormat:@"%ld",carry] atIndex:0];
    
    // Clean Prefix
    NSUInteger prefixCount = 0;
    for (int i = 0; i < retStr.length; i++) {
        if ([[retStr substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"1"]) {
            break;
        }
        prefixCount++;
    }
    
    return [retStr substringFromIndex:prefixCount];
}

@end
