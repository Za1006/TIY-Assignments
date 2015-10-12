//
//  DatePickerViewController.swift
//  Gigawatts
//
//  Created by Elizabeth Yeh on 10/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
    //    UIPickerViewDataSource, UIPickerViewDelegate

{
    @IBOutlet var picker: UIPickerView!
    var delegate: DatePickerDelegate?
//    ? optional, does not need to have a vaule
 

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        delegate?.destinationDateWasChosen(picker.Date)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
       return 88
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row)"
    }
//    confused on the rows that should be set..set for "destinationTime, lastTimeDeparture...or speed 0-88?
}
