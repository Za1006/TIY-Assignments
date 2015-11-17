//
//  Ticket.m
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

typedef enum
{
   winnerType1Dollar = 3,
   winnerType5Dollar = 4,
   winnerType20Dollar = 5,
   winnerType100Dollar = 6,
}WinnerType;

@interface Ticket  ()
{
    NSMutableArray *picks;
}

@end
@implementation Ticket


+ (instancetype)ticketUsingQuickPick
{
    Ticket *aTicket = [[Ticket alloc]init];
    for (int i = 0; i < 6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;

}
-(instancetype)init
{
    Ticket *aTicket = [[Ticket alloc] init];
    [aTicket insertPicksUsingArray:specificPicks];
    return aTicket;
}

-(instancetype)init
{
    if (self = [super init])
    {
        picks = [[NSMutableArray alloc] init];
        _winner =  NO;
        _payout = @"";
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@",picks[0], picks[1], picks[2], picks[3], picks[4], picks[5]];
}

-(NSArray *)picks
{
    return [picks copy];
}


- (void)createPick
{
    
    BOOL shouldAddPick = YES;
    do
    {
        int pickInt = arc4random() % 53 + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInt:pickInt];
        for (NSNumber *aPick in picks)
        {
            if ([pickAsNumber isEqualToNumber:aPick])
            {
                shouldAddPick = NO;
                break;
            }
        }
        else
        {
            shouldAddPick = YES;
        }
    }
    if (shouldAddPick)
    {
        [picks addObject:pickAsNumber];
    }
} while (!shouldAddPick);

   NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
[picks sortUsingDescriptors:@[lowestToHighest]];




@end
    
