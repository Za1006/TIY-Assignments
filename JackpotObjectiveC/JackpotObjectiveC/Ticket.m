//
//  Ticket.m
//  JackpotObjectiveC
//
//  Created by Elizabeth Yeh on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

<<<<<<< Updated upstream
{
    NSInteger aPick = arc4random_uniform(53) + 1;
    NSNumber *pickAsNumber = [NSNumber numberWithInteger: aPick];
    if (![_picks containsObject:pickAsNumber])
    {
    
        [_picks addObject: pickAsNumber];
        pickFound = YES;
    }
   while(!pickFound);
}
=======
//- (instancetype)init
//{
//    self = [super init];
//}

>>>>>>> Stashed changes

-(NSString*)description
{
    NSMutableString *numbers = [[NSMutableString alloc]init];
    for (NSNumber *pick in_picks)
    {
        [numbers appendString:[NSString stringWithFormat:@" %@",pick]];
    }
    return numbers;

}
@end
