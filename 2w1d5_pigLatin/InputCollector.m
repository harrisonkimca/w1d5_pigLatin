//
//  InputCollector.m
//  2w1d5_pigLatin
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString*)userInput:(NSString*)prompt
{
    char user[255];
    NSLog(@"%@", prompt);
    fgets(user, 255, stdin);
    NSString *input = [NSString stringWithCString:user encoding:NSUTF8StringEncoding];
    NSString *lowerCase = [input lowercaseString];
    NSString *trimmedString = [lowerCase stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

@end
