//
//  Blender.h
//  Constants
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 22: Constants
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Developers get tired of writing enum every time they reference
// an enumerated type, so they use typedef to create a shorthand for this:
/*
enum BlenderSpeed {
    BlenderSpeedStir = 1,
    BlenderSpeedChop = 2,
    BlenderSpeedLiquify = 5,
    BlenderSpeedPulse = 9,
    BlenderSpeedIceCrush = 15
};
*/
// Often we don't care about the numbers of the five speeds, only that they
// are different from each other. You may leave out the values as well.
typedef enum {
    BlenderSpeedStir,
    BlenderSpeedChop,
    BlenderSpeedLiquify,
    BlenderSpeedPulse,
    BlenderSpeedIceCrush
} BlenderSpeed;

@interface Blender : NSObject
{
    // speed must be one of the five speeds
    //enum BlenderSpeed speed; Needed if just using a enum.
    // creating typedef allows for tighter syntax.
    BlenderSpeed speed;
}

// setSpeed: expects one of the five speeds
// - (void)setSpeed:(enum BlenderSpeed)x; Needed if just using a enum.
// creating typedef allows for tighter syntax.
- (void)setSpeed:(BlenderSpeed)x;

NS_ASSUME_NONNULL_END

@end
