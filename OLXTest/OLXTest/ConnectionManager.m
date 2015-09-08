//
//  ConnectionManager.m
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import "ConnectionManager.h"
#import "Product.h"

@implementation ConnectionManager

static ConnectionManager *sharedInstance;
static NSString *baseURL = @"http://api-v2.olx.com/items";


static NSString *kConnectionManagerLocationKey = @"location";
static NSString *kConnectionManagerSearchTermKey = @"searchTerm";
static NSString *kConnectionManagerOLXURLValue = @"www.olx.com.ar";

+ (ConnectionManager *)sharedInstance{
    if(sharedInstance==nil){
        sharedInstance = [[ConnectionManager alloc]init];
    }
    return sharedInstance;
}

-(void)getProductsWithSearchTerm: (NSString *)searchTerm withCompletion:(void(^)(NSArray *))completion failedBlock:(void(^)(NSString *error))failedBlock{
    NSDictionary *parameters = @{kConnectionManagerLocationKey: kConnectionManagerOLXURLValue, kConnectionManagerSearchTermKey: searchTerm};
    [self GET:baseURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSArray *productsArray = [Product productsFromResponseApi:responseObject];
        completion(productsArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failedBlock(error.localizedDescription);
    }];
    
}

@end
