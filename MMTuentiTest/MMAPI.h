//
//  MMApi.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAPI : NSObject

+(instancetype)sharedInstance;
- (void)JSONArray:(NSURL *) url completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block ;


@end
