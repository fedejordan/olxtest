//
//  ProductsViewController.m
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductCell.h"
#import "Product.h"

@interface ProductsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *productsTableView;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.productsTableView registerNib:[UINib nibWithNibName:kProductCellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kProductCellIdentifier];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kProductCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [self.productsTableView dequeueReusableCellWithIdentifier:kProductCellIdentifier];
    Product *product = self.productsArray[indexPath.row];
    cell.titleLabel.text = product.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Product *product = self.productsArray[indexPath.row];
    NSString *message = [NSString stringWithFormat:@"El item seleccionado es #%@", product.productId];
    [[[UIAlertView alloc]initWithTitle:@"OLXTest" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}



@end
