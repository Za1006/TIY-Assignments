//
//  TimeCircuitsViewController.m
//  OutaTime Redux
//
//  Created by Elizabeth Yeh on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TimeCircuitsViewController.h"
#import "DatePickerViewController.h"

//>>>>>>> Stashed changes
NSTimer *speedTimer;

NSDateFormatter *NSdateFormatter;

NSInteger *currentSpeed;




@interface TimeCircuitsViewController ()

@property (weak) IBOutlet UILabel *destinationDateLabel;
@property (weak) IBOutlet UILabel *presentDateLabel;
@property (weak) IBOutlet UILabel *lastTimeDepartDaletLabel;
@property (weak) IBOutlet UILabel *mphLabel;

- (IBAction)travelBackButton:(UIButton *)sender;
- (IBAction)setDestinationTimeButton:(UIButton *)sender;


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
    
    
    
    //setup for determining the date format
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMM ddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
  
    
    [NSDateFormatter setDateFormat:formatString];
    
    
    self.presentDateLabel.text = [NSDateFormatter stringFromDate:[NSDate date]];
    
    
    // setup current speed of the 0mph label at start
    currentSpeed = 0;
    
    //setup the interpolation of changing speed on the mph label
    self.mphLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    
    //setup last time depart label to be same as storyboard
    self.lastTimeDepartDaletLabel.text = @"--- -- ----";
    
    
    // Set the date format (mm, dd, yyyy)
//    NSString *formatString = [[NSDateFormatter dateWithFormatFromTemplate:@"MMMM ddyyyy"options:0 locale:[NSLocale currentLocale]];
//comments
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//<<<<<<< Updated upstream


//>>>>>>> Stashed changes
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//prepare for segue function
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDatePickerSegue"])
       {
           DatePickerViewController *datePickerVC = (DatePickerViewController *)[segue destinationViewController];
           
           //set delegte object
           datePickerVC.delegate = self;
       }
}

- (void)destinationDateWasChosen:(NSDate *)destinationDate
{
    //setup destination label to the destination date with formatter object
    self.destinationDateLabel.text = [NSDateFormatter stringFromDate:destinationDate];
}

//Action Handlers

- (IBAction)travelBackButton:(UIButton *)sender
{
    [self startTimerCount];
}

- (IBAction)setDestinationTimeButton:(UIButton *)sender
{
    
}


- (void)startTimerCount
{
    if (!speedTimer)
    {
        speedTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updatedSpeed) userInfo:nil repeats:YES];
    }
}

- (void)stopTimerCount
{
    [speedTimer invalidate];
    speedTimer = nil;
}


- (void)updatedSpeed
{
    if (currentSpeed < 88)
    {
        currentSpeed = currentSpeed + 1;
        self.mphLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    }
    else
    {
        [self stopTimerCount];
        
        self.lastTimeDepartDaletLabel.text = self.presentDateLabel.text;
        
        self.presentDateLabel.text = self.destinationDateLabel.text;
        
        self.destinationDateLabel.text = @"--- -- ----";
        
        currentSpeed = 0;
        self.mphLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    }
}




@end
