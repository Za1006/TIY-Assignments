//
//  VoltageTypesTableViewController.h
//  High-Voltage-Redux
//
//  Created by Elizabeth Yeh on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageCalculateTableViewController.h"

@interface ValueTypesTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *operatorList;
@property (nonatomic, weak) id <ValueTypeDelegateProtocol> delegate;

@end
