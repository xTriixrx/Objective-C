//
//  SyncRequestSender.h
//  ImageFetch
//
//  Created by Vincent Nigro on 9/21/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyncRequestSender : NSObject

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request
                 returningResponse:(NSURLResponse *_Nullable*_Nullable)response
                             error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
