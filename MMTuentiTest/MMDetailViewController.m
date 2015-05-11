//
//  MMDetailViewController.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 9/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#import "MMDetailViewController.h"
#import "MMTransactionManager.h"
#import "MMConversionManager.h"
#import "MMDetailTableViewCell.h"

@interface MMDetailViewController ()

@property (nonatomic, strong) NSArray *transactionsOfSku;

-(void)loadData;

@end

@implementation MMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self loadData];
  
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    
    self.transactionsOfSku = [[MMTransactionManager sharedInstance]getTransactionsBySku:self.skuNumber on:self.allTransactions];
    
    self.totalAmountLabel.text = [NSString stringWithFormat:@"Total amount: %.02f EUR",[self calculateTotalAmount]];
    

}

-(float)calculateTotalAmount{
    
    float total = 0;
    for (NSObject *transaction in self.transactionsOfSku) {
        
        total = total + [[MMConversionManager sharedInstance]matchRateConversion:[[transaction valueForKey:@"amount" ]floatValue] from:[transaction valueForKey:@"currency"] on:self.tableRates];

    }
    
    return total;
}



#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.transactionsOfSku count];
 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    MMDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MMDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *transaction = [self.transactionsOfSku objectAtIndex:indexPath.row];
    
    cell.SKUNumberLabel.text =  [NSString stringWithFormat:@"%@",[transaction valueForKey:@"sku"]];
    
    cell.amountLabel.text =  [NSString stringWithFormat:@"%@ %@",[transaction valueForKey:@"amount"],[transaction valueForKey:@"currency"]];
    
    cell.imageTransaction.image = [UIImage imageNamed:@"12029-NNXQKB.jpg"];
    
    return cell;
}



@end
