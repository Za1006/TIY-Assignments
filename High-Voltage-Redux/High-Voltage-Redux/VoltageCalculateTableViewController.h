//
//  VoltageCalculateTableViewController.h
//  High-Voltage-Redux
//
//  Created by Elizabeth Yeh on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageBrain.h"

@protocol ValueTypeDelegateProtocol <NSObject>

 -(void)valueTypeWasChosen:(NSString *)electronicOperator;

@end

@protocol ElectricConvertionProtocol <NSObject>

-(void)valueWereCalculated;

@end
@interface VoltageCalculateTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *operatorList;
@property (nonatomic) NSMutableArray *operatorStoreList;

@property (nonatomic) UITextField *currentTextField;
@property (nonatomic) UITextField *resistanceTextField;
@property (nonatomic) UITextField *voltageTextField;
@property (nonatomic) UITextField *powerTextField;

@property (nonatomic) VoltageBrain *converter;

@property (nonatomic) NSMutableDictionary *valueTypes;


@end
