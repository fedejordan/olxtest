//
//  HomeViewController.m
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import "HomeViewController.h"
#import "ConnectionManager.h"
#import "ProductsViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

static NSString *kProductsSegue = @"productsSegue";
static NSString *kSearchingProducts = @"Buscando productos";

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didSelectSearch:(id)sender {
    NSString *searchTerm = self.searchTextField.text;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES].labelText = kSearchingProducts;
    [[ConnectionManager sharedInstance] getProductsWithSearchTerm:searchTerm withCompletion:^(NSArray *productsArray){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self performSegueWithIdentifier:kProductsSegue sender:productsArray];
    } failedBlock:^(NSString *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (IBAction)textFielDidEndOnExit:(id)sender {
    [self.searchTextField resignFirstResponder];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:kProductsSegue]){
        ProductsViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.productsArray = sender;
    }
}

@end
