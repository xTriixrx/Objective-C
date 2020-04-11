//
//  SyncRequestSender.m
//  ImageFetch
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "SyncRequestSender.h"

@implementation SyncRequestSender

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request
                 returningResponse:(NSURLResponse **)response
                             error:(NSError **)error
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);


    NSError __block *err = NULL;
    NSData __block *data;
    NSURLResponse __block *resp;

    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData* _data, NSURLResponse* _response, NSError* _error) {
        resp = _response;
        err = _error;
        data = _data;
        dispatch_group_leave(group);

    }] resume];

    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

    if (response)
    {
        *response = resp;
    }
    if (error)
    {
        *error = err;
    }

    return data;
}

@end
