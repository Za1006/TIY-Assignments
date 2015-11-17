//
//  WinningTicketViewController.h
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketTableViewController.h"

@interface WinningTicketViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic)id<WinningTicketViewControllerDelegate> delegate;

@end
