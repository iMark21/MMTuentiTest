//
//  ViewController.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 8/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#define RATES_URL @"http://quiet-stone-2094.herokuapp.com/rates.json"
#define TRANSACTIONS_URL @"http://quiet-stone-2094.herokuapp.com/transactions.json"

#import "MMMainViewController.h"
#import "MMAPI.h"
#import "MMTransactionManager.h"
#import "MMConversionManager.h"
#import "MMDetailViewController.h"
#import "MMMainTableViewCell.h"

@interface MMMainViewController ()

@property (nonatomic, strong) NSArray *transactions;

-(void)loadData;

@end

@implementation MMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.tableView.backgroundColor = [UIColor grayColor];
    [self loadData];
    
}

-(void)loadData{
    
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:TRANSACTIONS_URL] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        self.allTransactions = JSONArray;
        self.transactions = [[MMTransactionManager sharedInstance]getSkuList:JSONArray];
        [self.tableView reloadData];
        
    }];
    
    
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:RATES_URL] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        self.tableRates = JSONArray;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.transactions count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    MMMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MMMainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString *transactionSKU = [self.transactions objectAtIndex:indexPath.row];
    cell.skuNumberLabel.text =  transactionSKU;
    cell.imageTransaction.image = [UIImage imageNamed:@"05.jpg"];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detail"])
    {
        // Get reference to the destination view controller
        MMDetailViewController *vc = [segue destinationViewController];
        
        MMMainTableViewCell *cell = (MMMainTableViewCell *)sender;
        NSString *skuNumber = cell.skuNumberLabel.text;
        
        // Pass any objects to the view controller here, like...
        [vc setSkuNumber:skuNumber];
        [vc setAllTransactions:self.allTransactions];
        [vc setTableRates:self.tableRates];
    }
}

@end
