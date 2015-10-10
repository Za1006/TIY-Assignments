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
    func dateWasChosen(dateCount: Int)
}

class TimeCircutsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet var picker: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    var date: NSDateFormatter?


   