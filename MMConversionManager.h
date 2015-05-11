//
//  MMConversionManager.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMConversionManager : NSObject
+(instancetype)sharedInstance;
-(float)matchRateConversion: (float)amount from:(NSString*)currency to: (NSString *) newCurrency on:(NSArray*)rates;
@end
