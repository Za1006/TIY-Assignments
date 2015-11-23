//
//  ContactListViewController.swift
//  Contacts
//
//  Created by Elizabeth Yeh on 11/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController
{
    
     var newContact = Person()
    var delegate: ContactListViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
        birthdayTextField.text = ""

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - UIText Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField.text != ""
        {
            switch textField
            {
            case nameTextField:
                newContact.firstName = nameTextField.text!
                let nameComponents = newContact.firstName.characters.split(" ").map { String($0)}
                if nameComponents.count > 1
                {
                    newContact.firstName = nameComponents[0].capitalizedString
                    
                }
                if nameComponents.count >= 2
                {
                    nameComponents[0].capitalizedString
                    
                }
                phoneNumberTextField.becomeFirstResponder()
               case phoneNumberTextField:
                newContact.phoneNumber = phoneNumberTextField.text!
                birthdayTextField.becomeFirstResponder()
            default:
                newContact.birthday = birthdayTextField.text!
                addToContact()
                
            }
            rc = true
        }
        return rc
    }
    
    @IBAction func neverMindButtonPressed(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addToContactPressed(sender: UIButton)
    {
        addToContact()
    }
    
    func addToContact()
    {
        delegate?.contactWasAdded(newContact)
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    



}