//
//  c_numeric_validity.h
//  PropertyListBuilder
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 26: Property Lists
//
//  Created by Vincent Nigro on 9/24/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#ifndef c_numeric_validity_h
#define c_numeric_validity_h

#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

bool is_valid_int(const char *str);
bool is_valid_float(const char *str);

#endif /* c_numeric_validity_h */
