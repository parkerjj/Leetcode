//
//  Solution.m
//  125. Valid Palindrome
//
//  Created by Peigen.Liu on 2017/9/19.
//  Copyright © 2017年 Leetcode. All rights reserved.
//

#import "Solution.h"


//Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
//For example,
//"A man, a plan, a canal: Panama" is a palindrome.
//"race a car" is not a palindrome.
//
//Note:
//Have you consider that the string might be empty? This is a good question to ask during an interview.
//
//For the purpose of this problem, we define empty string as valid palindrome.




@implementation Solution

- (instancetype)init{
    self = [super init];
    if (self) {
        [self isPalindrome:@"A man, a plan, a canal: Panama"];
        [self isPalindrome:@"race a car"];
        [self isPalindrome:nil];
        [self isPalindrome:@""];
        [self isPalindrome:@"            "];
        [self isPalindrome:@"     a            "];


    }
    return self;
}



- (BOOL)isPalindrome:(NSString*)str{
    if (str.length <= 1) {
        NSLog(@"Coz str.length less then 1, so it's palindrome");
        return YES;
    }
    
    str = [str lowercaseString];
    
    NSInteger startIndex = 0;
    NSInteger endIndex = str.length - 1;
    while (startIndex < str.length && endIndex >= 0) {
        NSInteger startChar = [str characterAtIndex:startIndex];
        NSInteger endChar = [str characterAtIndex:endIndex];
        if (startChar < 'a' || startChar > 'z') {
            // Maybe space or common.
            startIndex++;
            continue;
        }
        
        if (endChar < 'a' || endChar > 'z') {
            // Maybe space or common.
            endIndex--;
            continue;
        }
        
        if (startChar != endChar) {
            NSLog(@"\n%@: NO,It's not palindrome",str);

            return NO;
        }else{
            startIndex++;
            endIndex--;
        }
        
    }
    
    NSLog(@"\n%@: Yes, It is",str);

    return YES;
}


@end
