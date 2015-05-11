//
//  MMDetailViewController.m
//  MMTuentiTest
//
//  Created by Michel Marqués on 9/5/15.
//  Copyright (c) 2015 Michel Marqués. All rights reserved.
//

#define RATES_URL @"http://quiet-stone-2094.herokuapp.com/rates.json"

#import "MMDetailViewController.h"
#import "MMTransactionManager.h"
#import "MMConversionManager.h"
#import "MMAPI.h"
#import "MMDetailTableViewCell.h"
#import "SVProgressHUD.h"

@interface MMDetailViewController ()

@property (nonatomic, strong) NSArray *transactionsOfSku;

-(void)loadData;

@end

@implementation MMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
  
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self loadData];
    UIBarButtonItem *righButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Calcular Total"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(calculateAction:)];
    self.navigationItem.rightBarButtonItem = righButton;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:RATES_URL] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        self.tableRates = JSONArray;
        [SVProgressHUD dismiss];
        
    }];
    
    self.transactionsOfSku = [[MMTransactionManager sharedInstance]getTransactionsBySku:self.skuNumber on:self.allTransactions];

}

-(float)calculateTotalAmountIn:(NSString *)currency{
    
    float total = 0;
    for (NSObject *transaction in self.transactionsOfSku) {
        
        total = total + [[MMConversionManager sharedInstance]matchRateConversion:[[transaction valueForKey:@"amount" ]floatValue] from:[transaction valueForKey:@"currency"] to:currency on:self.tableRates];

    }
    
    return total;
}

-(IBAction)calculateAction:(id)sender{
    

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Total Amount: %.02f EUR",[self calculateTotalAmountIn:@"EUR"]]
                                                    message:[NSString stringWithFormat:@"Total Amount: %.02f USD",[self calculateTotalAmountIn:@"USD"]]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
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
