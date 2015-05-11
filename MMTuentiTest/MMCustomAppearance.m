//
//  MMCustomAppearance.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 11/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMCustomAppearance.h"
#import <UIKit/UIKit.h>

@implementation MMCustomAppearance

+(instancetype)sharedInstance{
    
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(void)applyAppearance{
    
    [self setupNavigationBarAppearance];

}

-(void)setupNavigationBarAppearance{
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:15/255.0 green:117/255.0 blue:178/255.0 alpha:1.0]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

}


@end
