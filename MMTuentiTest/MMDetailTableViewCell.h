//
//  MMDetailTableViewCell.h
//  MMTuentiTest
//
//  Created by Michel Marqués on 11/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *SKUNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageTransaction;

@end
