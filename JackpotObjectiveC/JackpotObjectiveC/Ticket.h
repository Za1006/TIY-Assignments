//
//  Ticket.h
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (nonatomic) BOOL *winner;
@property (nonatomic) NSString *payout;
@property(nonatomic)NSMutableArray *pick;
//@property (nonatomic, assign) int *pick;

@end
