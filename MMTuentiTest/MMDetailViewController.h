//
//  MMDetailViewController.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 9/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (nonatomic, strong) NSString *skuNumber;
@property (nonatomic, strong) NSArray *allTransactions;
@property (nonatomic, strong) NSArray *tableRates;

@end
