//
//  ViewController.swift
//  Calculator
//
//  Created by Elizabeth Yeh on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{

    
    var brain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!
    
    
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

// MARK: - Action Handlers
    
    @IBAction func operators(sender: UIButton)
    {
        brain.assignSymbol(sender.currentTitle!)
    }
    
    @IBAction func clear(sender: UIButton)
    {
        display.text = "0"
        brain = CalculatorBrain()
    }
    
    @IBAction func input(sender: UIButton)
    {
        display.text = brain.assignOperand(sender.currentTitle!)
    }
    
    @IBAction func calculate(sender: UIButton)
    {
        display.text = brain.calculateAnswer(sender.currentTitle!)
    }
}

