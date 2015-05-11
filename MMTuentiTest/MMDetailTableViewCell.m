//
//  MMDetailTableViewCell.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 11/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMDetailTableViewCell.h"

@implementation MMDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:.4];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10,5, self.contentView.frame.size.width -20, self.contentView.frame.size.height -10)];
    
    view1.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:view1];
    
    self.selectedBackgroundView = view;
    
    
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
