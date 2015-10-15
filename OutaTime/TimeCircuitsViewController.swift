//
//  ViewController.swift
//  Gigawatts
//
//  Created by Elizabeth Yeh on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate
{
    func destinationDateWasChosen(destinationCount: NSDate)
    
}

class TimeCircutsViewController: UIViewController, DatePickerDelegate
{
    
    @IBOutlet var destinationTimeLabel: UILabel!
    let dateFormat: String!
//    NSDateFormatter?
    
//    let dateFormatter = NSDateFormatter()
//    dateFormatter.dateFormat = "mm-dd-yyyy"
//    return date!
    
    @IBOutlet var setAndStopDestinationButton: UIButton!
    @IBOutlet var lastTimeDepartureLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!

    
    var originalCount = 88
    var currentSpeed = 0
    //    unable to set @IBOutlet from storyboard

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func destinationDateWasChosen(destinationDateWasChosen: NSDate)
    {
        
    }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
            let datePickerVC = segue.destinationViewController as DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
}
// MARK: - DatePicker Delegate

func destinationDateWasChosen(destinationCount: NSDate)
//    func destinationDateWasChosen(destinationCount: NSDate)

{
//    destinationTimeLabel.text = dateFormatter.stringFromDate
//    (dateFormat into a string: dateFormatter.stringFromDate. see Quiz)
}

// MARK: - Action Handlers

@IBAction func setDesticationTapped(sender: UIButton)
{
    
}

@IBAction func travelBackTapped(sender: UIButton)
{
    startTimer()
}
// MARK: - Private

private func startTimer()
{
    if timer == nil
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updatespeedLabel", userInfo: nil, repeats: true)
//        setAndStopDestinationButton.setTitle("Pause", forState: UIControlState.Normal)
        
    }
    func updateSpeedLabel()
    { 
       if currentSpeed != 88
       {
         currentSpeed += 1
         speedLabel.text = String(currentspeed)
    }
    
    else
    {
        stopTimer()
          lastTimeDepartureLabel.text = presentTimeLabel.text
          presentTimeLabel.text = destinationTimeLabel.text
    }
}


}