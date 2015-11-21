//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Elizabeth Yeh on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

      @IBOutlet weak var tableSortSegmentedControl: UISegmentedControl!
    
      @IBOutlet weak var tableView: UITableView!
    
    
    let realm = try! Realm()
    
    var contacts: Results<Person>!
    var currentCreateAction: UIAlertAction!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        contacts = realm.objects(Person).sorted("name")
//        contacts = realm.objects(Person).sorted("family")
//        contacts = realm.objects(Person).sorted("friends")
    }
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
        let aContact = contacts[indexPath.row]
        cell.textLabel?.text = aContact.name
        cell.detailTextLabel?.text = aContact.phoneNumber
        
        
       
        return cell
        
    }
    @IBAction func addContact(sender: UIBarButtonItem)
    {
        let alertController = UIAlertController(title: "Add Contact", message: "Type the person's name.", preferredStyle: UIAlertControllerStyle.Alert)
        currentCreateAction = UIAlertAction(title: "Create", style: .Default) {
            (action) -> Void in
            
            let personName = alertController.textFields?.first?.text
            let newPerson = Person()
            newPerson.name = personName!
            
            
            try! self.realm.write({ () -> Void in
             self.realm.add(newPerson)
                self.tableView.reloadData()
                
            })
            
        }
        alertController.addAction(currentCreateAction)
        currentCreateAction.enabled = false
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alertController.addTextFieldWithConfigurationHandler {
            (textField) -> Void in
            textField.placeholder = "Name"
            textField.addTarget(self, action: "contactNameFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    @IBAction func changeSortCriteria(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            contacts = contacts.sorted("name")
        }
        else
        {
            contacts = contacts.sorted("phone number", ascending: false)
        }
        tableView.reloadData()
    }
    
    func contactNameFieldDidChange(sender: UITextField)
    {
        self.currentCreateAction.enabled = sender.text?.characters.count > 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let contactDetailVC = storyboard?.instantiateViewControllerWithIdentifier("ContactDetailViewController") as! ContactDetailViewController
        contactDetailVC.contact = contacts[indexPath.row]
        navigationController?.pushViewController(contactDetailVC, animated: true)
    }
 

}
