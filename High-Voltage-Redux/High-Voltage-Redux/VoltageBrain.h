//
//  VoltageBrain.h
//  High-Voltage-Redux
//
//  Created by Elizabeth Yeh on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoltageCalculateTableViewController.h"


@interface VoltageBrain : NSObject



@property (assign) BOOL allvaluesFound;
@property (strong, nonatomic) NSString *ampsString;
@property (strong, nonatomic) NSString *ohmsString;
@property (strong, nonatomic) NSString *wattsString;
@property (strong, nonatomic) NSString *voltsString;

@property(strong, nonatomic) id <ElectricConvertionProtocol> delegate;

-(void)findOtherValuesIfPossible;
@end
