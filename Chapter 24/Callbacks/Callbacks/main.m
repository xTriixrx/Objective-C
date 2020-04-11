//
//  main.m
//  Callbacks
//
//  This file is from the Objective-C Programming The Big Nerd Ranch Guide
//      Chapter 24: Callbacks
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // In real world applications, there needs to be an object that waits for events like mouse movements, etc.
        // On Mac OS X and iOS this object is an instance of NSRunLoop. We say that when something happens,
        // the run loop of an application causes a callback to occur.
        
        // There are 3 forms that a callback can take, referring to 'x' means 'a specific something' that happens.
        //      TARGET-ACTION: Before the wait begins you say "When x happens, send this particular message to that
        //      particular object." The object receiving the message is the TARGET. The selector for the message is
        //      the ACTION.
        //
        //      HELPER OBJECTS: Before the wait begins, you say "Here is a helper object that conforms to your protocol.
        //      Send it messages when things happen." (More on protocols next Chapter.) Helper objects are often known
        //      as delegates or data sources.
        //
        //      NOTIFICATIONS: There is an object called the notification center. Before the wait begins, you say to the
        //      notification center "This object is waiting for these sort of notifications. When one of those notifications
        //      arrives, send the object this message." When x happens, an object posts a notification to the notification
        //      center, and the center forwards it on to your object.
        
        // Target-action
        Logger *logger = [[Logger alloc] init];
        // unused is a flag modifier to silence the unused warning.
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(sayOuch:)
                                                        userInfo:nil
                                                         repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
        
        // Objects that just do one thing (like NSTimer) use target-action.
        
        // Callbacks and object ownership
        // With all these types of callbacks, there is a danger that objects waiting for the callbacks might
        // not get deallocated correctly. Thus it was decided that:
        //      1. Notification centers do not own their observers.
        //          If an object is an observer, it will typically remove itself from the notification
        //          center in its dealloc method:
        //          - (void)dealloc
        //          {
        //              [[NSNotificationCenter defaultCenter] removeObserver:self];
        //          }
        //      2. Objects do not own their delgates or data sources.
        //          If you create an object that is a delgate or data source, your object should "excuse"
        //          itself in its dealloc method:
        //          - (void)dealloc
        //          {
        //              [windowThatBossesMeAround setDelegate:nil];
        //              [tableViewThatBegsForData setDataSource:nil];
        //          }
        //      3. Objects do not own their targets.
        //          If you create an object that is a target, your object should zero the target pointer
        //          in its dealloc method.
        //          - (void)dealloc
        //          {
        //              [buttonThatKeepsSendingMessages setTarget:nil];
        //          }
        // Note: None of these issues exist within these sections of Callbacks (1,2,3) because the Logger object
        // will not be deallocated before the program terminates. (Also, in a bit of a fluke, in this exercise we used
        // two well-documented exceptions to the rules: an NSURLConnection owns it delegate and an NSTimer owns its target.)
    }
    return 0;
}
