//
//  MMConversionManager.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMConversionManager.h"

@implementation MMConversionManager

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(float)matchRateConversion: (float)amount from:(NSString*)currency to:(NSString *) newCurrency on:(NSArray*)rates{

    
    if ([newCurrency isEqualToString:currency]) {
        return amount;
    }else{
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"from == %@ AND to== %@",currency, newCurrency];
        
        NSArray *ratesFiltered = [rates filteredArrayUsingPredicate:predicate];
        
        float rateValue = 0;
        float result = 0;
        
        if (ratesFiltered.count>0) {
            rateValue = [[[ratesFiltered valueForKey:@"rate"] firstObject]floatValue];
            result = amount * rateValue;
            
            
        }else{
            
            predicate = [NSPredicate predicateWithFormat:@"from == %@",currency];
            
            ratesFiltered = [rates filteredArrayUsingPredicate:predicate];
            
            NSArray *currencyNew = [ratesFiltered valueForKey:@"to"];
            
            rateValue = [[[ratesFiltered valueForKey:@"rate"] firstObject]floatValue];
            
            float newAmount = amount * rateValue;
            
            result = [self matchRateConversion:newAmount from:[currencyNew firstObject] to:newCurrency on:rates];
            
            
        }
        
        return result;

        
    }
    
    
    
    
}

@end
