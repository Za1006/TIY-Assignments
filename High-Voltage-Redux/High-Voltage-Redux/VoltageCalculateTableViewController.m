//
//  VoltageCalculateTableViewController.m
//  High-Voltage-Redux
//
//  Created by Elizabeth Yeh on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "VoltageCalculateTableViewController.h"
#import "ValueTypesTableViewController.h"
#import "CalculationTableViewCell.h"
#import "VoltageBrain.h"

@interface VoltageCalculateTableViewController () <UITextFieldDelegate, UIPopoverPresentationControllerDelegate, ValueTypeDelegateProtocol, ElectricConvertionProtocol>

@property (nonatomic) VoltageBrain *converter;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addTypeValueButon;

@end

@implementation VoltageCalculateTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _operatorList = [[NSMutableArray alloc] init];
    _operatorStoreList = [[NSMutableArray alloc] init];
    
    [_operatorList addObject:@"Watts"];
    [_operatorList addObject:@"Volts"];
    [_operatorList addObject:@"Amps"];
    [_operatorList addObject:@"Ohms"];

   _valueTypes =  [ NSMutableDictionary dictionaryWithDictionary:@{@"Amps":@"CurrentCell", @"Ohms":@"ResistanceCell", @"Volts":@"VoltageCell", @"Watts":@"PowerCell"}];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _operatorStoreList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalculationTableViewCell *cell = (CalculationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CalculationTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    
//    UITextField * textField = (UITextField *)[cell viewWithTag:1];
//    textField.text = @"";
//    textField.delegate = self;
//    textField.userInteractionEnabled = [self.converter allvaluesFound];
    
    
    cell.valueTextField.text =[NSString stringWithFormat:@"%lid",(long)indexPath.row];
    cell.typeLabel.text = _operatorStoreList[indexPath.row];
    UITextField * textField = (UITextField *)[cell viewWithTag:1];
    textField.text = @"";
    textField.delegate = self;
    textField.userInteractionEnabled = [self.converter allvaluesFound];
    
//    switch (identifier)
//    {
//    case "CurrentCell":
//        currentTextField = textField
//        if (_converter?.ampsString != "")
//        {
//            textField.text = converter?.ampsString
//        }
//        
//    case "ResistanceCell":
//        resistanceTextField = textField
//        if converter?.ohmsString != ""
//        {
//            textField.text = converter?.ohmsString
//        }
//        
//    case "PowerCell":
//        powerTextField = textField
//        if converter?.wattsString != ""
//        {
//            textField.text = converter?.wattsString
//        }
//        
//    case "VoltageCell":
//        voltageTextField = textField
//        if converter?.voltsString != ""
//        {
//            textField.text = converter?.voltsString
//        }
//        
//    default:
//        print("")
//    }
    return cell;
}
//
//-(void)textFieldShouldReturn
//{
//    BOOL rc = NO;
//    if (_textField.text != @"")
//    {
//        BOOL rc = YES;
//        if (_textField == _currentTextField)
//        {
//            converter?.ampsString = textField.text!
//        }
//        if textField == resistanceTextField
//        {
//            converter?.ohmsString = textField.text!
//        }
//        if textField == voltageTextField
//        {
//            converter?.voltsString = textField.text!
//        }
//        if textField == powerTextField
//        {
//            converter?.wattsString = textField.text!
//        }
//    }
//    
//    if rc
//    {
//        textField.resignFirstResponder()
//    }
//    
//    converter?.findOtherValuesIfPossible()
//    
//    return rc
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation (ShowPopoverValueTypesTableViewControllerSegue)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowPopoverValueTypesTableViewControllerSegue"])
    {
        UITableViewController *newController = segue.destinationViewController;
        ValueTypesTableViewController *newValueTypeVC = (ValueTypesTableViewController *)newController;
        newValueTypeVC.operatorList =  [_operatorList mutableCopy];
        newValueTypeVC.popoverPresentationController.delegate = self;
        newValueTypeVC.delegate = self;
        double contentHight = 45.0 * (CGFloat) _operatorList.count;
        newValueTypeVC.preferredContentSize = (CGSizeMake(100.0, contentHight));
        
    }
}
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController: (UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

- (void)valueTypeWasChosen: (NSString *)electronicOperator
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@" you return : %@", electronicOperator);
    [self.operatorList removeObject:electronicOperator];
    
    [self.operatorStoreList addObject:electronicOperator];
    NSLog(@" operatorStoreList : %@", _operatorStoreList);
    [self.tableView reloadData];
    
    
    if ([self.converter isEqual: nil])
    {
        self.converter = [[VoltageBrain alloc] init];
        self.converter.delegate = self;
    }
    
    NSString * cellIdentifier = [self.valueTypes objectForKey: electronicOperator ];
    [self.operatorStoreList addObject: cellIdentifier ];
    if ([_operatorStoreList count] == 2) 
    {
        self.addTypeValueButon.enabled = false;
    }
    
    NSUInteger row = [_operatorStoreList indexOfObject:cellIdentifier];
  //  tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: row, inSection: 0)], withRowAnimation: .Automatic)
    
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}




-(void)valueWereCalculated
{
    [self resetValueTypesDictionary];
    
    if (_voltageTextField == nil)
    {
        NSString *cellIdentifier =[NSString stringWithFormat: @"Volts"];
        // [self _operatorStoreList.appendString: *cellIdentifier ]
        [self.operatorStoreList addObject: cellIdentifier ];
        
    }
    if (_currentTextField == nil)
    {
        NSString *cellIdentifier = [NSString stringWithFormat: @"Amps"];
        [self.operatorStoreList addObject: cellIdentifier ];
    }
    if (_resistanceTextField == nil)
    {
        NSString *cellIdentifier = [NSString stringWithFormat: @"Ohms"];
        [self.operatorStoreList addObject: cellIdentifier ];
    }
    if (_powerTextField == nil)
    {
        NSString *cellIdentifier = [NSString stringWithFormat: @"Watts"];
        [self.operatorStoreList addObject: cellIdentifier ];
    }
    
    [self.tableView reloadData];
}

-(void)resetValueTypesDictionary
{
    [self.valueTypes removeAllObjects];
    _valueTypes =  [ NSMutableDictionary dictionaryWithDictionary:@{@"Amps":@"CurrentCell", @"Ohms":@"ResistanceCell", @"Volts":@"VoltageCell", @"Watts":@"PowerCell"}];
}

@end
