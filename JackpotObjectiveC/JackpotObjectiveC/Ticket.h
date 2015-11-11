//
//  Ticket.h
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (assign) BOOL winner;
@property (nonatomic) NSArray *numbers;
@property (nonatomic) NSString *payout;
@property (nonatomic) NSArray *winningNumbers;
@property (nonatomic) NSArray *picks;

-(NSString *)checkWinningTicket:(NSMutableArray *)winningNumbers;

@end
