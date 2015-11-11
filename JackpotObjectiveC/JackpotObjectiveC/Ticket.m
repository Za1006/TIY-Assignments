//
//  Ticket.m
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

- (instancetype)init
{
    self = [super init];
    _picks = [[NSArray alloc] init];
    _winner = NO;
    _payout = @"";
    return self;
}


//- (void)createQuickPick
//{
//    _winner = NO;
//    _payout = @"";
//    
//    for (int x = 0; x < 6; x++)
//    {
//        [self createPick];
//    }
//    
- (void)createPick
{
    pickFound = BOOL
    
    if pickFound = NO
    {
        NSInteger aPick = arc4random_uniform(53) + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInteger: aPick];
        if (![_picks containsObject:pickAsNumber])
        {
            
            [_picks addObject: pickAsNumber];
            pickFound = YES;

    }
}
    }
//   while(!pickFound);

- (void)createQuickPick
{
    _winner = NO;
    _payout = @"";
    
    for (int x = 0; x < 6; x++)
    {
        [self createPick];
    }
    

-(NSString *)checkWinningTicket:(NSMutableArray *)winningTicketNumbers
{
    int matchingTickets = 0;
    
    NSString *prize = [[NSString alloc] init];
    prize = @"$0";
    self.winner = NO;
    
    for(NSNumber *winningNumbers in winningTicketNumbers)
    {
        for (NSNumber *number in self.numbers)
        {
            if ([number isEqualToNumber:winningTicketNumbers])
            {
                matchingTickets += 1;
            }
        }
   }
}

if (matchingTickets == 3)
{
    prize = @"$1";
    self.winner = YES;
}
else if (matchingTickets == 4)
{
    prize = @"$5";
    self.winner = YES;
}
else if (matchingTickets == 5)
{
    
}



-(NSString*)description
{
    NSMutableArray *numbers = [[NSMutableArray alloc]init];
    for (NSNumber *pick in_picks)
    {
        [numbers appendString:[NSString stringWithFormat:@"%@",pick]];
    }
    return numbers;

}
@end
    
