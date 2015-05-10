//
//  MMApi.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMAPI.h"

@implementation MMAPI

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

- (void)JSONArray:(NSURL *) url completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block {

    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    if(jsonArray) {
        block(jsonArray, nil);
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_download_error" code:1
                                         userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
        block(nil, error);
    }
    
    
}


@end
