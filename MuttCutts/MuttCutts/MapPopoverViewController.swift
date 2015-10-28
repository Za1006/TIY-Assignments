//
//  MapPopoverViewController.swift
//  MuttCutts
//
//  Created by Elizabeth Yeh on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MapPopoverViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var FirstUITextField: UITextField!
    
    @IBOutlet weak var SecondUITextField: UITextField!
    
    @IBAction func SearchLocation(sender: UIButton)
    {
        if FirstUITextField
    }
    
    var delegate: MapPopoverViewControllerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if FirstUITextField.text == ""
        {
            FirstUITextField.becomeFirstResponder()
        }

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
         var rc = true
        
        if ((textField.text?.componentsSeparatedByString(",").count) != nil)
        {
            switch textField
            {
            case FirstUITextField: SecondUITextField.becomeFirstResponder()
            default: SecondUITextField.resignFirstResponder()
                rc = true
    
            }
        }
        else
        {
            switch textField
            {
            case FirstUITextField: FirstUITextField.placeholder = "Type in a City, State"
            default: SecondUITextField.placeholder = "Type in a City, State"
            }
        }
        return rc
        
        func search()
        {
            
        }
//        set this function after function of the UIButton
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
