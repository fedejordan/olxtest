//
//  ConnectionManager.h
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface ConnectionManager : AFHTTPRequestOperationManager

+ (ConnectionManager *)sharedInstance;
-(void)getProductsWithSearchTerm: (NSString *)searchTerm withCompletion:(void(^)(NSArray *))completion failedBlock:(void(^)(NSString *error))failedBlock;

@end
