//
//  c_numeric_validity.c
//  PropertyListBuilder
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 26: Property Lists
//
//  Created by Vincent Nigro on 9/24/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#include "c_numeric_validity.h"

/*
 *
 *
 */
bool is_valid_int(const char *str) {
    int i = 0;
    if(*str == '-' && i == 0)
        ++str;
    if(!*str)
        return false;
    while(*str) {
        if(!isdigit(*str))
            return false;
        else
            ++str;
    }
    return true;
}

/*
 *
 *
 */
bool is_valid_float(const char *str) {
    bool decimal = false;
    if(*str == '-')
        ++str;
    if(*str == '.') {
        decimal = true;
        ++str;
    }
    if(!*str)
        return false;
    while(*str) {
        if(!isdigit(*str)) {
            if(*str == '.' && decimal == false) {
                decimal = true;
                ++str;
            }
            else
                return false;
        }
        else
            ++str;
    }
    return true;
}
