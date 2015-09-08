//
//  Product.m
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import "Product.h"

@implementation Product

static NSString *kProductDataKey = @"data";
static NSString *kProductIdKey = @"id";
static NSString *kProductTitleKey = @"title";

+(NSArray *)productsFromResponseApi: (NSDictionary *)responseDictionary{
    NSDictionary *dataDict = responseDictionary[kProductDataKey];
    NSMutableArray *resultArray = @[].mutableCopy;
    for(NSDictionary *productDict in dataDict){
        Product *newProduct = [[Product alloc]init];
        newProduct.productId = productDict[kProductIdKey];
        newProduct.title = productDict[kProductTitleKey];
        [resultArray addObject:newProduct];
    }
    return resultArray;
}

@end
