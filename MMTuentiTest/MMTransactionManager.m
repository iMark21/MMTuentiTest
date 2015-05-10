//
//  TransactionManager.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMTransactionManager.h"

@implementation MMTransactionManager

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(NSArray *)getSkuList: (NSArray *)array{
    
    NSArray *SkuArray = [array valueForKey:@"sku"];
    
    SkuArray = [[NSSet setWithArray:SkuArray] allObjects];
    
    return SkuArray;
}

-(NSArray *)getTransactionsBySku: (NSString *)sku on:(NSArray *)array{
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sku == %@",sku];
    NSArray *transactions = [array filteredArrayUsingPredicate:predicate];
    
    return transactions;
    
}

@end
