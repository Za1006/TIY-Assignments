//
//  ViewController.swift
//  Clock
//
//  Created by Elizabeth Yeh on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var clockView: ClockView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        clockView.timezone = NSTimeZone(name: "America/New_York")
//        let clockView = ClockView(frame: CGRect(x: view.center.x - 70.0, y: view.center.y - 70.0, width: 140.0, height: 140.0))
//        
//        clockView.timezone = NSTimeZone(name: "America/New_York")
//        view.addSubview(clockView)
//        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

