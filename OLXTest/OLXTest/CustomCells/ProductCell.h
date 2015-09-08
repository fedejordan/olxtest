//
//  ProductCell.h
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *kProductCellIdentifier = @"ProductCell";
static CGFloat kProductCellHeight = 44.0;

@interface ProductCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end
