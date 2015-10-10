//
//  DatePickerViewController.swift
//  Gigawatts
//
//  Created by Elizabeth Yeh on 10/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet var picker: UIPickerView!
    var delegate: DatePickerViewController?

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
    
    func speedOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 0
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
      return 88
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row+1)"
    }
}
