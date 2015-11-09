//
//  TimeCircuitsViewController.h
//  OutaTime Redux
//
//  Created by Elizabeth Yeh on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCircuitsViewController : UIViewController


@property (weak) IBOutlet UILabel *destinationTimeLabel;
@property (weak) IBOutlet UILabel *destinationDateLabel;
@property (weak) IBOutlet UILabel *presentTimeLabel;
@property (weak) IBOutlet UILabel *presentDateLabel;
@property (weak) IBOutlet UILabel *lastTimeDepartLabel;
@property (weak) IBOutlet UILabel *lastTimeDepartDaletLabel;
@property (weak) IBOutlet UILabel *speedLabel;
@property (weak) IBOutlet UILabel *mphLabel;
- (IBAction)setDesTimeButton:(UIButton *)sender;
- (IBAction)travelBackButton:(UIButton *)sender;


@end
