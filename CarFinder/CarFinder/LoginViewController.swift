//
//  LoginViewController.swift
//  CarFinder
//
//  Created by Elizabeth Yeh on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func userCanSignIn() -> Bool
    {
        if usernameTextField.text != "" && passwordTextField.text != ""
        {
            return true
        }
        
        return false
    }
    
    
    @IBAction func signInTapped(sender: UIButton)
    {
        if userCanSignIn()
        {
            PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil
                {
                    print("login successful")
                //  let VC = self.storyboard?.instantiateInitialViewControllerWithIdentifier(mapVC) as! MapViewController
                    
                    self.performSegueWithIdentifier("ShowRegisterSegue", sender: self)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                }
                else
                {
                    print(error?.localizedDescription)
                    self.passwordTextField.text = ""
                    self.passwordTextField.placeholder = "Invalid Password"
                }
            }
        }
        
    }
    
//    func textFieldShouldReturn(textField: UITextField)
//    {
//        var rc = false
//        if usernameTextField.text != ""
//        {
//            rc = true
//            usernameTextField.resignFirstResponder()
//            passwordTextField.becomeFirstResponder()
//        }
//        if usernameTextField.text != "" && passwordTextField.text != ""
//        {
//            signInTapped()
//            rc = true
//        }
//        return rc
//    }

}
