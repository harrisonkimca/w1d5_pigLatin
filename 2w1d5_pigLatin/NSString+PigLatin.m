//
//  NSString+PigLatin.m
//  2w1d5_pigLatin
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString*)stringByPigLatinization
{
    NSCharacterSet *consonants = [NSCharacterSet characterSetWithCharactersInString:@"bcdfghjklmnpqrstvwxyz"];
    NSMutableArray *snippets = [[NSMutableArray alloc]init];
    NSString *pig = [[NSString alloc]init];
    
    // put sentence into 'words' array and then for each 'word' into 'letters' array(one word per loop)
    NSArray *words = [self componentsSeparatedByString:@" "];
    for (NSString *word in words)
    {
        NSMutableArray *letters = [[NSMutableArray alloc]init];
        for (int i = 0; i < [word length]; i++)
        {
            NSString *letter = [word substringWithRange:NSMakeRange(i, 1)];
            [letters addObject:letter];
        }
        
        // find first consonant or vowel/consonent to pig latinize
        NSRange firstConsonant = [word rangeOfCharacterFromSet:consonants];
        NSRange wordRange = NSMakeRange(0, [word length]);
        NSRange pigRange;
        
        if (firstConsonant.location == wordRange.location)
        {
            pigRange = firstConsonant;
        }
        else
        {
            pigRange = NSMakeRange(firstConsonant.location, firstConsonant.location + 1);
        }
        // pigLatinize word and add to snippets array
        if ([letters count] == 1)
        {
            [snippets addObject:[letters [0]stringByAppendingString:@"ay"]];
        }
        else
        {
            // add in new pigLatinized string
            pig = [[[word substringWithRange:pigRange]stringByAppendingString:@"ay"]lowercaseString];
            [letters removeObjectsInRange:pigRange];
            [letters addObject:pig];
            NSString *wordString  = [letters componentsJoinedByString:@""];
            [snippets addObject:wordString];
        }
    }
    // reassemble string
    NSString *pigLatinized = [snippets componentsJoinedByString:@" "];
    return pigLatinized;
}

@end
