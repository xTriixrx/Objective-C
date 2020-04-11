//
//  main.m
//  PropertyListBuilder
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 26: Property Lists
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyBuilder.h"

void welcomeMessage(void);

// This file creates a tool on building a property list and asks the user if they would like to write
// the .plist XML file to their CWD (current working directory) for the property list they have built.

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *DATATYPES = [NSArray arrayWithObjects:ARR, DICT, STR, DATA, DATE, INT, FLT, BOOLEAN, nil];
        NSMutableDictionary *types = [NSMutableDictionary dictionary];
        NSString *dataType = [[NSString alloc] init];
        char buff[BUFSIZ] = "";
        char input = '!';
        
        for(NSString *type in DATATYPES) {
            NSMutableArray *newType = [[NSMutableArray alloc] init];
            [types setObject:newType forKey:type];
        }
        
        do {
            welcomeMessage();
            scanf("%[^\n]%*c", buff);
            if(buff[1] != 0) {
                continue;
            }
            else
                sscanf(buff, "%c", &input);
            
        } while(input != 'Y');
        
        while(input != '-') {
            printf("------------------------------------------------------------------------------------------\n");
            bool typeErr;
            do {
                typeErr = false;
                printf("Please enter a type:\n");
                printf("> ");
                scanf("%[^\n]%*c", buff);
                NSString *type = [NSString stringWithUTF8String:buff];
                
                if([type isEqual:EXIT]) {
                    input = '-';
                    break;
                }
                
                if(![DATATYPES containsObject:type]) {
                    printf("Incompatible type: %s\n", buff);
                    typeErr = true;
                }
                else {
                    dataType = type;
                }
            
            }while(typeErr);
            
            if(input == '-')
                continue;
            
            switch([PropertyBuilder dataTypeSwitch:dataType]){
                case 1: // Handle Arrays
                    [types setObject:[PropertyBuilder setNSArrays:[types objectForKey:ARR]] forKey:ARR];
                    break;
                case 2: // Handle Dictionaries
                    [types setObject:[PropertyBuilder setNSDictionaries:[types objectForKey:DICT]] forKey:DICT];
                    break;
                case 3: // Handle Strings
                    [types setObject:[PropertyBuilder setNSStrings:[types objectForKey:STR]] forKey:STR];
                    break;
                case 4: // Handle Data Objs
                    [types setObject:[PropertyBuilder setNSDatas:[types objectForKey:DATA]] forKey:DATA];
                    break;
                case 5: // Handle Dates
                    [types setObject:[PropertyBuilder setNSDates:[types objectForKey:DATE]] forKey:DATE];
                    break;
                case 6: // Handle Integers
                    [types setObject:[PropertyBuilder setIntegers:[types objectForKey:INT]] forKey:INT];
                    break;
                case 7: // Handle Floats
                    [types setObject:[PropertyBuilder setFloats:[types objectForKey:FLT]] forKey:FLT];
                    break;
                case 8: // Handle Booleans
                    [types setObject:[PropertyBuilder setBooleans:[types objectForKey:BOOLEAN]] forKey:BOOLEAN];
                    break;
                default: // Error
                    printf("DATATYPESWITCH HILVL ERR\n");
                    exit(1);
                    break;
            }
            
        } // while input != '-'
        
        bool invalid_end = true;
        do {
            printf("Would you like to print out the generated property list or to write it to a file? (PRINT/WRITE)\n");
            printf("> ");
            scanf("%[^\n]%*c", buff);
            NSString *end = [NSString stringWithUTF8String:buff];
            if([end isEqual:PRINT]) {
                NSLog(@"%@", types);
                invalid_end = false;
                break;
            }
            else if([end isEqual:WRITE]) {
                [types writeToFile:@"/tmp/types.plist" atomically:YES];
                printf("Printed types.plist to /tmp/ directory\n");
                invalid_end = false;
                break;
            }
            else
                printf("Invalid input, please enter either PRINT or WRITE.\n");
        } while(invalid_end);
    
    }
    return 0;
}

void welcomeMessage() {
    printf(" --- Welcome to the Property List Builder Terminal Tool! ---\n");
    printf("In the Builder Loop you will first input the type you would like to enter:\n");
    printf("TYPES: array, dictionary, string, data, date, integer, float, boolean\n");
    printf("You will then be prompted for the value(s) corresponding to that type.\n");
    printf("Once value(s) are entered (some will ask for more than one and exit subloop with '-' character\n");
    printf("The loop will ask for a new type again, when finished enter '-' to exit.\n");
    printf("Once the loop has exited the program will ask if you'd like to save an XML file\n");
    printf("If the file is not saved, the program will dump the property list to the console instead\n");
    printf("  You are about to enter the Builder Loop... are you ready?\n");
    printf("Please enter (Y/N) in the below prompt, Y will enter Loop.\n");
}
