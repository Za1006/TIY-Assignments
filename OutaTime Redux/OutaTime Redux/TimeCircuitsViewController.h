//
//  TimeCircuitsViewController.h
//  OutaTime Redux
//
//  Created by Elizabeth Yeh on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeCircuitsDatePickerDelegate //

- (void)destinationDateWasChosen:(NSDate *)destinationDate;

@end




@interface TimeCircuitsViewController : UIViewController <TimeCircuitsDatePickerDelegate>

@end
