//
//  MMMainTableViewCell.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 11/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMMainTableViewCell.h"

@implementation MMMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)didMoveToSuperview{
    
    [self addLayerToCell];
    
}

-(void)addLayerToCell{
    
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor clearColor];
    
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
    sublayer.frame = CGRectMake(10,5, self.bounds.size.width -20, self.bounds.size.height -10);
    sublayer.borderColor = [UIColor darkGrayColor].CGColor;
    
    [view1.layer addSublayer:sublayer];
    [self setBackgroundView:view1];
    
}

@end
