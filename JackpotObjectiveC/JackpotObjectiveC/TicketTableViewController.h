//
//  JackpotTableViewController.h
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@protocol WinningTicketViewControllerDelegate

- (void) winningTicketWasAdded:(Ticket *)ticket;

@end

@interface TicketTableViewController : UITableViewController <WinningTicketViewControllerDelegate>

@end
