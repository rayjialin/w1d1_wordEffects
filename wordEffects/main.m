//
//  main.m
//  wordEffects
//
//  Created by ruijia lin on 4/9/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        // 255 unit long array of characters
        char inputChars[255];
        BOOL playAgainBool = YES;
        char inputNumber[256];
        NSArray *emojiArray = @[@"🤐", @"🤯", @"👺",@"🧟",@"🧖",@"🧠",@"💬",@"🦊",@"🐾",@"🍽️",@"💮"];
        
        while (playAgainBool == YES) {
            // for use in case 8 and 9
            NSMutableString *finalString = [[NSMutableString alloc] init];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is: %s\nFollowing actions can be performed to manipulate the string: \n\t1.Uppercase \n\t2.Lowercase\n\t3.Numberize\n\t4.Canadianize\n\t5.Respond\n\t6.De-Space-It\n\t7.Letter Count\n\t8.Remove Punctuaction\n\t9.Replace letters with emoji", inputChars);
            
            printf("\n\n\tPick your action: ");
            fgets(inputNumber, 256, stdin);
            
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            NSString *inputNum = [NSString stringWithUTF8String:inputNumber];
            
            switch ([inputNum integerValue]) {
                case 1:  // Convert to upperCase
                    NSLog(@"\n%@", [inputString uppercaseString]);
                    break;
                case 2: // Convert to lowerCase
                    NSLog(@"\n%@", [inputString lowercaseString]);
                    break;
                case 3: // Convert string to integer, otherwise raise message
                    if ([inputString integerValue] == 0){
                        NSLog(@"\nThe conversion was not successful.  %@ is not an integer.", [inputString substringToIndex:[inputString length] - 3]);
                    }else {
                        NSLog(@"\nThe conversion was successful, the converted integer is: %li", [inputString integerValue]);
                    }
                    break;
                case 4: // Convert string to append ", eh?" at the end
                    NSLog(@"\n%@, eh?", [inputString substringToIndex:[inputString length] - 3]);
                    break;
                case 5: // Respond to question mark and exclaimation mark with messages
                    if ([inputString characterAtIndex:[inputString length] - 2] == '?'){
                        NSLog(@"\nI dont't know");
                    }else if ([inputString characterAtIndex:[inputString length] - 2] == '!') {
                        NSLog(@"\nWhoa, calm down!");
                    }else {
                        NSLog(@"\n%@", inputString);
                    }
                    break;
                case 6: // Replace whitespace in string with '-'
                    NSLog(@"\nString replaced the whitespace with '-': %@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
                case 7: // Counting letters in string
                    NSLog(@"\nThe input string has %li letters.", [inputString length]);
                    break;
                case 8:{
                    // Remove all punctuation from the string
                    for (int i = 0; i < [inputString length] - 2; i++){
                        NSString* string = [NSString stringWithFormat:@"%c" , [inputString characterAtIndex:i]];
                        if ([@"!?.," containsString:string]){
                            // do nothing
                        }else {
                            [finalString appendString:string];
                        }
                    }
                    NSLog(@"%@", finalString);
                    break;
                }
                case 9:{
                    // Convert every letter to emoji
                    NSInteger emojiIndex;
                    for (int i = 0; i < [inputString length] - 1; i++){
                        emojiIndex = arc4random_uniform(10) + 1;
                        [finalString appendString:[emojiArray objectAtIndex:emojiIndex]];
                    }
                    
                    NSLog(@"%@", finalString);
                }
                    break;
                default:
                    break;
                }
            }
        }
        return 0;
}
