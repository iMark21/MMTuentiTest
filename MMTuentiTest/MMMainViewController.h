//
//  ViewController.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *allTransactions;
@property (nonatomic, strong) NSArray *tableRates;
@end

