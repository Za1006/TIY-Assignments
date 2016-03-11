//
//  DatePickerViewController.h
//  OutaTime Redux
//
//  Created by Elizabeth Yeh on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCircuitsViewController.h"

@interface DatePickerViewController : UIViewController

//declare delgate for Datepicker
@property (strong, nonatomic) id<TimeCircuitsDatePickerDelegate> delegate;

@end
