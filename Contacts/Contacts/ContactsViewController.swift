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


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        contacts = realm.objects(Person).sorted("name")
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
        cell.detailTextLabel?.text = aContact.birthday
        
        
       
        return cell
        
    }
    @IBAction func addContact(sender: UIBarButtonItem)
    {
        
    }
 

}
