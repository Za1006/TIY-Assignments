//
//  WinningTicketViewController.m
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "WinningTicketViewController.h"

@interface WinningTicketViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSNumber *firstNumber;
    NSNumber *secondNumber;
    NSNumber *thirdNumber;
    NSNumber *fourthNumber;
    NSNumber *fifthNumber;
    NSNumber *sixthNumber;
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)checkTicketButton:(UIButton *)sender;

@end

@implementation WinningTicketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (IBAction)checkTicketButton:(UIButton *)sender
{
    if([self allNumbersArePicked])
    {
        Ticket *winningTicket = [Ticket ticketUsingArray:@[firstNumber,secondNumber, thirdNumber, fourthNumber, fifthNumber, sixthNumber]];
        [self.delegate winningTicketWasAdded:winningTicket];
    }
}

#pragma mark - UIPickerView data source

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 53;
}

#pragma mark - UIPickerView delegate

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 20.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 40.0f;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)row + 1 ];

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            firstNumber = [NSNumber numberWithInteger:row+1];
            break;
            
        case 1:
            secondNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 2:
            thirdNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 3:
            fourthNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 4:
            fifthNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 5:
            sixthNumber = [NSNumber numberWithInteger:row+1];
            break;
            
        default:
            break;
    }
}

-(BOOL)allNumbersArePicked
{
    BOOL rc = NO;
    
    if (firstNumber && secondNumber && thirdNumber && fourthNumber && fifthNumber && sixthNumber)
    {
        rc = YES;
    }
    return rc;
}



@end
