//
//  main.m
//  WordEffects
//
//  Created by Narendra Thapa on 2016-01-11.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

//  Function to return string in uppercase
void uppercase(NSString *inputString) {
    NSLog(@"String in Upper Case: %@", [inputString uppercaseString]);
}

//  Function to return string in lowercase
void lowercase(NSString *inputString) {
    NSLog(@"String in Lower Case: %@", [inputString lowercaseString]);
}

//  Function to return concatenated string
void canadianize(NSString *inputString) {
    NSString *concatenatedString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSLog(@"Canadianized string: %@", [concatenatedString stringByAppendingString:@", eh?"]);
}

//  Function to return string where space is replaced by hyphen '-'
void deSpace(NSString *inputString) {
    NSString *hyphenForSpaceString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    NSLog(@"DeSpaced string: %@", hyphenForSpaceString);
}

// Function to return string after converting to integer is possible
void numberize(NSString *inputString) {
    NSUInteger num = [inputString intValue];
    
    // Checking to see is user has input 0
    if ([inputString isEqualToString:@"0\n"] && num == 0) {
        NSLog(@"Your Number value is %lu and new value after adding 10 is %lu", num, num+10);
    }
    // Checking to see if user has input a numeric value
    else if (num != 0){
        NSLog(@"Your Number value is %lu and new value after adding 10 is %lu", num, num+10);
    }
    // Notifying user that input is not a numeric value
    else {
        NSLog(@"You have entered a non-numeric value");
    }
}

// Function to return response of "I don't know" for last character '?' or "Whoa, calm down!" for last character '!'
void respond(NSString *inputString) {
    NSUInteger length = [inputString length];
    
    if (length >= 2){
        length = length - 1;
    }
    
    // Calculating the length of string
    NSLog(@"Length of string %lu", (unsigned long)length);
    
    // Using above value to extract the last character
    NSString *lastCharacter = [inputString substringFromIndex:length-1];

    if ([lastCharacter isEqualToString:@"?\n"]) {
        NSLog(@"I don't know");
    } else if ([lastCharacter isEqualToString:@"!\n"]) {
        NSLog(@"Whoa, calm down!");
    }
}

// Program asks user for input string and action to be performed on the string
int main(int argc, const char * argv[]) {
    
    NSUInteger selectionNum = 0;
    
    // While loop checks for user option and exits when choosen
    while (selectionNum != 7) {
        
    // Asking user for action choice
    char inputChoice[255];
    NSLog(@"\nUppercase: 1\nLowercase: 2\nCanadianize: 3\nDeSpace: 4\nRespond: 5\nNumberize: 6\nExit: 7\nPlease enter you choice (1-7): ");
    fgets(inputChoice, 255, stdin);
   
    NSString *inputNum = [NSString stringWithUTF8String:inputChoice];
        
    // Converting user input to integer
    NSUInteger num = [inputNum intValue];
    selectionNum = num;
        
    if (selectionNum == 7) {
        
        // Exits program is user chooses to exit
        NSLog(@"Thanks for using the program");
        EXIT_SUCCESS;
    }
        // Asks user for string in case option 1-6 is choosen
    else if (selectionNum >= 1 && selectionNum <= 6)  {
    
                // Asking user for input string
                char inputChars[255];
                NSLog(@"Enter your string: \n");
                fgets(inputChars, 255, stdin);
                NSString *inputString = [NSString stringWithUTF8String:inputChars];
    
                // Appropriate function is called as per user preference
                switch (num)    {
                    case 1:
                        uppercase(inputString);
                        break;
                    case 2:
                        lowercase(inputString);
                        break;
                    case 3:
                        canadianize(inputString);
                        break;
                    case 4:
                        deSpace(inputString);
                        break;
                    case 5:
                        respond(inputString);
                        break;
                    case 6:
                        numberize(inputString);
                        break;
                    default:
                        break;
                    }
        }
    
    else {
            
            // If user inputs something other than 1-7
            NSLog(@"Invalid Option.");
            EXIT_SUCCESS;
        }
    }
    return 0;
}
