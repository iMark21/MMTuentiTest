//
//  TransactionManager.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMTransactionManager : NSObject
+(instancetype)sharedInstance;
-(NSArray *)getSkuList: (NSArray *)array;
-(NSArray *)getTransactionsBySku: (NSString *)sku on:(NSArray *)array;
@end
