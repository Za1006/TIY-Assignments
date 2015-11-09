//
//  TimeCircuitsViewController.m
//  OutaTime Redux
//
//  Created by Elizabeth Yeh on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TimeCircuitsViewController.h"
NSTimer *NSspeedTimer;
NSDateFormatter *NSdateFormatter;
NSInteger *currentSpeedTime;



@interface TimeCircuitsViewController ()

@property (weak) IBOutlet UILabel *destinationDateLabel;
@property (weak) IBOutlet UILabel *presentDateLabel;
@property (weak) IBOutlet UILabel *lastTimeDepartDaletLabel;
@property (weak) IBOutlet UILabel *mphLabel;

- (IBAction)travelBackButton:(UIButton *)sender;

//functions for controlling moving methods
- (void)startTimerCount;
- (void)stopTimerCount;
- (void)updatedSpeed;


@end

@implementation TimeCircuitsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //setting label
    self.title = @"OutaTime";
    
    
    //setting the dateformatter to remember what the user picks as Date
    NSdateFormatter = [[NSDateFormatter alloc] init];
    
    
    // Set the date format (mm, dd, yyyy)
//    NSString *formatString = [[NSDateFormatter dateWithFormatFromTemplate:@"MMMM ddyyyy"options:0 locale:[NSLocale currentLocale]];
//comments
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
