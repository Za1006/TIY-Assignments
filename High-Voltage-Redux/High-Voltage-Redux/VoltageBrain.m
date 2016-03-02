//
//  VoltageBrain.m
//  High-Voltage-Redux
//
//  Created by Elizabeth Yeh on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "VoltageBrain.h"

@implementation VoltageBrain

-(id)init
//-(instance)init
{
    self = [super init];
    if (self)
    {
        self.allvaluesFound = NO;
        self.ampsString = [[NSString alloc] init];
        self.ohmsString = [[NSString alloc] init];
        self.wattsString = [[NSString alloc] init];
        self.voltsString = [[NSString alloc] init];
        
    }
    return self;
}

-(void)findOtherValuesIfPossible
{
    int count = 0;
    if (![_ampsString  isEqual: @""])
    {
        count++;
    }
    if (![_ohmsString  isEqual: @""])
    {
        count++;
    }
    if (![_wattsString  isEqual: @""])
    {
        count++;
    }
    if (![_voltsString  isEqual: @""])
    {
        count++;
    }
    if (count >= 2)
    {
        [self calculateAllValues];// calculateAllValues()
    }
    
}

-(void)calculateAllValues
{
    double amps = 0.0, ohms = 0.0, volts = 0.0, watts = 0.0;
    if (![_ohmsString  isEqual: @""] && ![_voltsString  isEqual: @""])
//  if (self.ohmsString && self.voltsString)
    {
        ohms = [_ohmsString doubleValue];
        volts = [_voltsString doubleValue];
        amps = volts / ohms;
        watts = volts * amps;
    }
    else if (![_ohmsString  isEqual: @""] && ![_ampsString  isEqual: @""])
    {
        ohms = [_ohmsString doubleValue];
        amps = [_ampsString doubleValue];
        volts = amps * ohms;
        watts = volts * amps;
    }
    else if (![_ohmsString  isEqual: @""] && ![_wattsString  isEqual: @""])
    {
        ohms = [_ohmsString doubleValue];
        watts = [_wattsString doubleValue];
        amps = sqrt(watts / ohms);
        volts = amps * ohms;
    }
    else if (![_ampsString  isEqual: @""] && ![_voltsString  isEqual: @""])
    {
        volts = [_voltsString doubleValue];
        amps = [_ampsString doubleValue];
        ohms = volts / amps;
        watts = volts * amps;
    }
    else if (![_wattsString  isEqual: @""] && ![_ampsString  isEqual: @""])
    {
        watts = [_wattsString doubleValue];
        amps = [_ampsString doubleValue];
        volts = watts / amps;
        ohms = volts / amps;
    }
    else if (![_voltsString  isEqual: @""] && ![_wattsString  isEqual: @""])
    {
        volts = [_voltsString doubleValue];
        watts = [_wattsString doubleValue];
        amps = watts / volts;
        ohms = volts / amps;
    }
    _voltsString = [NSString stringWithFormat:@"%g", volts];
    _ampsString = [NSString stringWithFormat:@"%g", amps];
    _ohmsString = [NSString stringWithFormat:@"%g", ohms];
    _wattsString = [NSString stringWithFormat:@"%g", watts];
    
    _allvaluesFound = YES;
    [self.delegate valueWereCalculated];
}

@end
