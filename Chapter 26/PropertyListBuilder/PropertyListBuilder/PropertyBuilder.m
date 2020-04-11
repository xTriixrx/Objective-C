//
//  PropertyBuilder.m
//  PropertyListBuilder
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 26: Property Lists
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "PropertyBuilder.h"

@implementation PropertyBuilder

const NSString *ARR  = @"array";
const NSString *DICT = @"dictionary";
const NSString *STR  = @"string";
const NSString *DATA = @"data";
const NSString *DATE = @"date";
const NSString *INT  = @"integer";
const NSString *FLT  = @"float";
const NSString *BOOLEAN = @"boolean";
const NSString *EXIT = @"-";
const NSString *PRINT = @"print";
const NSString *WRITE = @"write";

/**
 *
 *
 */
+ (int)dataTypeSwitch:(NSString *)s
{
    if([s isEqual:ARR])
        return 1;
    else if ([s isEqual:DICT])
        return 2;
    else if ([s isEqual:STR])
        return 3;
    else if ([s isEqual:DATA])
        return 4;
    else if ([s isEqual:DATE])
        return 5;
    else if ([s isEqual:INT])
        return 6;
    else if ([s isEqual:FLT])
        return 7;
    else if ([s isEqual:BOOLEAN])
        return 8;
    else {
        printf("DATATYPESWITCH ERR\n");
        exit(1);
    }
}

/**
 *
 *
 */
+ (NSMutableArray *)setNSArrays:(NSMutableArray *)arrayContainer
{
    int length = 0;
    int arrCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";

    while(input != '-') {
        printf("To exit Array Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating Array Number: %d\n", arrCount);
        bool arrErr;
        NSString *elem;
        do {
            arrErr = false;
            printf("How many elements would you like to have in this array? ('-' to exit array adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                arrErr = true;
            }
            else
                length = [elem intValue];
            
        } while(arrErr);
        
        if(input == '-')
            continue;
        
        NSMutableArray *newElement = [[NSMutableArray alloc] init];
        int int_holder = 0;
        float float_holder = 0;
        for(int i = 0; i < length; i++) {
            printf("Please enter value %d to be stored in the array:\n", i + 1);
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *value = [NSString stringWithUTF8String:buf];
            const char *c_str_value = [value UTF8String];
            if(is_valid_int(c_str_value)) { // int
                int_holder = [value intValue];
                [newElement addObject:[NSNumber numberWithInt:int_holder]];
            }
            else if(is_valid_float(c_str_value)) { // float
                float_holder = [value floatValue];
                [newElement addObject:[NSNumber numberWithFloat:float_holder]];
            }
            else // anything else is recognized as a string
                [newElement addObject:value];
        }
        [arrayContainer addObject:newElement];
        arrCount++;
        
        do {
            printf("Would you like to add another array to property list? (Y/N or '-' to exit array adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return arrayContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setNSDictionaries:(NSMutableArray *)dictContainer
{
    int length = 0;
    int dictCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";

    while(input != '-') {
        printf("To exit Dictionary Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating Dictionary Number: %d\n", dictCount);
        bool dictErr;
        NSString *elem;
        do {
            dictErr = false;
            printf("How many elements would you like to have in this dictionary? ('-' to exit dictionary adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                dictErr = true;
            }
            else
                length = [elem intValue];
            
        } while(dictErr);
        
        if(input == '-')
            continue;
        
        NSMutableDictionary *newElement = [[NSMutableDictionary alloc] init];
        int int_holder = 0;
        float float_holder = 0;
        id keyValue = 0;
        for(int i = 0; i < length; i++) {
            // Handle input of whichever user gives for the array.
            // Either a string (NSString) or number (NSNumber)
            printf("Please enter key %d for upcoming value in dictionary:\n", i + 1);
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *key = [NSString stringWithUTF8String:buf];
            keyValue = key;
            printf("Please enter value %d to be stored in the dictionary:\n", i + 1);
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *value = [NSString stringWithUTF8String:buf];
            const char *c_str_value = [value UTF8String];
            if(is_valid_int(c_str_value)) { // int
                int_holder = [value intValue];
                [newElement setObject:[NSNumber numberWithInt:int_holder] forKey:keyValue];
            }
            else if(is_valid_float(c_str_value)) { // float
                float_holder = [value floatValue];
                [newElement setObject:[NSNumber numberWithFloat:float_holder] forKey:keyValue];
            }
            else // anything else is recognized as a string
                [newElement setObject:value forKey:keyValue];
        }
        [dictContainer addObject:newElement];
        dictCount++;
        
        do {
            printf("Would you like to add another dictionary to property list? (Y/N or '-' to exit dictionary adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return dictContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setNSStrings:(NSMutableArray *)strContainer
{
    int length = 0;
    int strCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";
    
    while(input != '-') {
        printf("To exit String Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating String Number: %d\n", strCount);
        bool strErr;
        NSString *elem;
        do {
            strErr = false;
            printf("How many strings would you like to have in the property list? ('-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                strErr = true;
            }
            else
                length = [elem intValue];
            
        } while(strErr);
        
        if(input == '-')
            continue;
        
        NSString *newElement = [[NSString alloc] init];
        
        for(int i = 0; i < length; i++) {
            printf("Please enter value %d to be stored in the property list:\n", i + 1);
            printf("> ");
            scanf("%[^\n]%*c", buf);
            newElement = [NSString stringWithUTF8String:buf];
            [strContainer addObject:newElement];
            strCount++;
        }
        
        do {
            printf("Would you like to add another set of strings to property list? (Y/N or '-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return strContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setNSDatas:(NSMutableArray *)dataContainer
{
    int length = 0;
    int dataCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";
    
    while(input != '-') {
        printf("To exit Data Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating Data Number: %d\n", dataCount);
        bool dataErr;
        NSString *elem;
        do {
            dataErr = false;
            printf("How many data objects would you like to have in the property list? ('-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                dataErr = true;
            }
            else
                length = [elem intValue];
            
        } while(dataErr);
        
        if(input == '-')
            continue;
        
        NSString *newElement = [[NSString alloc] init];
        
        for(int i = 0; i < length; i++) {
            printf("Please enter value %d to be stored in the property list:\n", i + 1);
            printf("> ");
            scanf("%[^\n]%*c", buf);
            newElement = [NSString stringWithUTF8String:buf];
            NSData* data = [newElement dataUsingEncoding:NSUTF8StringEncoding];
            [dataContainer addObject:data];
            dataCount++;
        }
        
        do {
            printf("Would you like to add another set of data objects to property list? (Y/N or '-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return dataContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setNSDates:(NSMutableArray *)dateContainer
{
    int length = 0;
    int dateCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";
    
    while(input != '-') {
        printf("To exit Data Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating Data Number: %d (MM/DD/YYYY)\n", dateCount);
        bool dateErr;
        NSString *elem;
        do {
            dateErr = false;
            printf("How many data objects would you like to have in the property list? ('-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                dateErr = true;
            }
            else
                length = [elem intValue];
            
        } while(dateErr);
        
        if(input == '-')
            continue;
        
        NSString *value = [[NSString alloc] init];
        
        for(int i = 0; i < length; i++) {
            bool notDate = true;
            NSDate *date;
            do {
                printf("Please enter value %d to be stored in the property list:\n", i + 1);
                printf("> ");
                scanf("%[^\n]%*c", buf);
                value = [NSString stringWithUTF8String:buf];
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"MM/dd/yyyy"];
                date = [dateFormat dateFromString:value];
                if(date != nil)
                    notDate = false;
                else
                    printf("What you entered was not a correct date, please enter a correct value.\n");
            } while(notDate);
            [dateContainer addObject:date];
            dateCount++;
        }
        
        do {
            printf("Would you like to add another set of data objects to property list? (Y/N or '-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return dateContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setIntegers:(NSMutableArray *)intContainer
{
    int length = 0;
    int intCount = 1;
    char input = '!';
    char buf[BUFSIZ] = "";
    
    while(input != '-') {
        printf("To exit Integer Structure Builder, enter '-' when prompted to exit.\n");
        printf("Creating Integer Number: %d\n", intCount);
        bool strErr;
        NSString *elem;
        do {
            strErr = false;
            printf("How many integers would you like to have in the property list? ('-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);

            elem = [NSString stringWithUTF8String:buf];
            
            if([elem isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            const char *c_str_elem = [elem UTF8String];
            if(!is_valid_int(c_str_elem)) {
                printf("Invalid element number: %s\n", c_str_elem);
                strErr = true;
            }
            else
                length = [elem intValue];
            
        } while(strErr);
        
        if(input == '-')
            continue;
        
        NSString *value = [[NSString alloc] init];
        
        for(int i = 0; i < length; i++) {
            int int_holder = 0;
            bool notInteger = true;
            do {
                printf("Please enter value %d to be stored in the property list:\n", i + 1);
                printf("> ");
                scanf("%[^\n]%*c", buf);
                value = [NSString stringWithUTF8String:buf];
                const char *c_str_value = [value UTF8String];
                if(is_valid_int(c_str_value)) {
                    int_holder = [value intValue];
                    notInteger = false;
                }
                else
                    printf("What you entered was not an integer, please enter a correct value.\n");
            } while(notInteger);
            [intContainer addObject:[NSNumber numberWithInt:int_holder]];
            intCount++;
        }
        
        do {
            printf("Would you like to add another set of integers to property list? (Y/N or '-' to exit string adding)\n");
            printf("> ");
            scanf("%[^\n]%*c", buf);
            NSString *type = [NSString stringWithUTF8String:buf];
            if([type isEqual:EXIT]) {
                input = '-';
                break;
            }
            
            if(buf[1] != 0)
                continue;
            else
                sscanf(buf, "%c", &input);
            
        } while(input != 'Y');
        
    } // while
    return intContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setFloats:(NSMutableArray *)floatContainer
{
      int length = 0;
      int floatCount = 1;
      char input = '!';
      char buf[BUFSIZ] = "";
      
      while(input != '-') {
          printf("To exit Float Structure Builder, enter '-' when prompted to exit.\n");
          printf("Creating Float Number: %d\n", floatCount);
          bool strErr;
          NSString *elem;
          do {
              strErr = false;
              printf("How many floats would you like to have in the property list? ('-' to exit string adding)\n");
              printf("> ");
              scanf("%[^\n]%*c", buf);

              elem = [NSString stringWithUTF8String:buf];
              
              if([elem isEqual:EXIT]) {
                  input = '-';
                  break;
              }
              
              const char *c_str_elem = [elem UTF8String];
              if(!is_valid_int(c_str_elem)) {
                  printf("Invalid element number: %s\n", c_str_elem);
                  strErr = true;
              }
              else
                  length = [elem intValue];
              
          } while(strErr);
          
          if(input == '-')
              continue;
          
          NSString *value = [[NSString alloc] init];
          
          for(int i = 0; i < length; i++) {
              float float_holder = 0;
              bool notInteger = true;
              do {
                  printf("Please enter value %d to be stored in the property list:\n", i + 1);
                  printf("> ");
                  scanf("%[^\n]%*c", buf);
                  value = [NSString stringWithUTF8String:buf];
                  const char *c_str_value = [value UTF8String];
                  if(is_valid_float(c_str_value)) {
                      float_holder = [value floatValue];
                      notInteger = false;
                  }
                  else
                      printf("What you entered was not a float, please enter a correct value.\n");
              } while(notInteger);
              [floatContainer addObject:[NSNumber numberWithFloat:float_holder]];
              floatCount++;
          }
          
          do {
              printf("Would you like to add another set of floats to property list? (Y/N or '-' to exit string adding)\n");
              printf("> ");
              scanf("%[^\n]%*c", buf);
              NSString *type = [NSString stringWithUTF8String:buf];
              if([type isEqual:EXIT]) {
                  input = '-';
                  break;
              }
              
              if(buf[1] != 0)
                  continue;
              else
                  sscanf(buf, "%c", &input);
              
          } while(input != 'Y');
          
      } // while
      return floatContainer;
}

/**
 *
 *
 */
+ (NSMutableArray *)setBooleans:(NSMutableArray *)boolContainer
{
      int length = 0;
      int boolCount = 1;
      char input = '!';
      char buf[BUFSIZ] = "";
      
      while(input != '-') {
          printf("To exit Boolean Structure Builder, enter '-' when prompted to exit.\n");
          printf("To enter a boolean value either enter 'Y/N'.\n");
          printf("Creating String Number: %d\n", boolCount);
          bool strErr;
          NSString *elem;
          do {
              strErr = false;
              printf("How many boolean values would you like to have in the property list? ('-' to exit string adding)\n");
              printf("> ");
              scanf("%[^\n]%*c", buf);

              elem = [NSString stringWithUTF8String:buf];
              
              if([elem isEqual:EXIT]) {
                  input = '-';
                  break;
              }
              
              const char *c_str_elem = [elem UTF8String];
              if(!is_valid_int(c_str_elem)) {
                  printf("Invalid element number: %s\n", c_str_elem);
                  strErr = true;
              }
              else
                  length = [elem intValue];
              
          } while(strErr);
          
          if(input == '-')
              continue;
          
          NSString *value = [[NSString alloc] init];
          
          for(int i = 0; i < length; i++) {
              bool notBool = true;
              do {
                  printf("Please enter value %d to be stored in the property list:\n", i + 1);
                  printf("> ");
                  scanf("%[^\n]%*c", buf);
                  value = [NSString stringWithUTF8String:buf];
                  if([value isEqualToString:@"Y"]) {
                      [boolContainer addObject:[NSNumber numberWithInt:1]];
                      notBool = false;
                  }
                  else if([value isEqualToString:@"N"]) {
                      [boolContainer addObject:[NSNull null]];
                      notBool = false;
                  }
                  else
                      printf("What you entered was not a boolean, please enter a correct value.\n");
              } while(notBool);
              boolCount++;
          }
          
          do {
              printf("Would you like to add another set of boolean values to property list? (Y/N or '-' to exit string adding)\n");
              printf("> ");
              scanf("%[^\n]%*c", buf);
              NSString *type = [NSString stringWithUTF8String:buf];
              if([type isEqual:EXIT]) {
                  input = '-';
                  break;
              }
              
              if(buf[1] != 0)
                  continue;
              else
                  sscanf(buf, "%c", &input);
              
          } while(input != 'Y');
          
      } // while
      return boolContainer;
}
@end
