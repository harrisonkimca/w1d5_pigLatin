//
//  main.m
//  2w1d5_pigLatin
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "NSString+PigLatin.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL loop = YES;
        
        NSLog(@"Let's do pig latin!");
        
        while (loop)
        {
            NSString *input = [[[InputCollector alloc]init]userInput:@"Please type in a sentence"];
            NSLog(@"Your sentence is: %@", input);
            NSString *pigLatin = [input stringByPigLatinization];
            NSLog(@"%@", pigLatin);
        }
        
    }
    return 0;
}
