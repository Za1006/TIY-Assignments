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
    var delegate: ForecasterModalViewControllerDelegate?
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    @IBAction func 找城市Button(sender: UIButton)
    {
        if zipcode(zipcodeTextField.text!)
        {
            search(Int(zipcodeTextField.text!)!)
        }
    }
    func zipcode(zip: String) -> Bool
    {
        var rc = false
        if zip.characters.count == 5 && Int(zip) != nil
        {
            rc = true
        }
        else
        {
            zipcodeTextField.text = ""
            zipcodeTextField.placeholder = "Zip Code Here"
        }
        return rc 
    }
    override func viewDidLoad()
    {
        
        title = "改變城市"
        
        super.viewDidLoad()
//        
        if zipcodeTextField.text! == ""
        {
            zipcodeTextField.becomeFirstResponder()
        }

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func cancelButton(sender: UIBarButtonItem)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
// MARK: - UITextField Delegate:
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        if zipcode(textField.text!)
        {
            search(Int(textField.text!)!)
            rc = true
        }
        return rc
    }
    
    func search(zip: Int)
{
    let zipCode = String(zip)
    delegate?.zipcodeWasChosen(zipCode)
}
// MARK: - Navigation


    
}



