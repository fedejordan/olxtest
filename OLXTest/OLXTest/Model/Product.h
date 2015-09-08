//
//  Product.h
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *title;

+(NSArray *)productsFromResponseApi: (NSDictionary *)responseDictionary;

@end
