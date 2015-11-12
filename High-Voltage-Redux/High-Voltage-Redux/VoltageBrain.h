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



@property (nonatomic) BOOL allvaluesFound;
@property (nonatomic) NSString *ampsString;
@property (nonatomic) NSString *ohmsString;
@property (nonatomic) NSString *wattsString;
@property (nonatomic) NSString *voltsString;

@property(nonatomic, weak) id <ElectricConvertionProtocol> delegate;


@end
