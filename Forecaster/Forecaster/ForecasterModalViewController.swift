//
//  ForecasterDetailViewController.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ForecasterModalViewController: UIViewController, UITextFieldDelegate 
{

    @IBOutlet weak var zipcodeTextField: UITextField!
    
    @IBAction func 找城市Button(sender: UIButton)
    {
        
    }
    
    override func viewDidLoad()
    {
        
        title = "改變城市"
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: UIBarButtonItem)
    {
        if zipcodeTextField != nil
        {
            return
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: - UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        if textField != ""
        {
            if textField == zipcodeTextField
            {
                zipcodeTextField.becomeFirstResponder()
            }
            else if textField != zipcodeTextField
            {
                rc = false
            }
        }
        return rc
  }
}