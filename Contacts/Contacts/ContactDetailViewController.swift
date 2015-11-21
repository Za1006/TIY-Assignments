//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Elizabeth Yeh on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ContactDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    let realm = try! Realm()
    
    var contact: Person?
//    var  family: Person?
//    var friends: Person?
    var allPeople: Results<Person>!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        allPeople = realm.objects(Person).filter("name !=%@", contact!.name).sorted("name")
//        allPeople = realm.objects(Person).filter("name !=%@", family!.name).sorted("family")
//        allPeople = realm.objects(Person).filter("name !=%@", friends!.name).sorted("friends")
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - UITableView Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return allPeople.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Add contacts"
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
        let aPossibleContact = allPeople[indexPath.row]
        cell.textLabel?.text = aPossibleContact.name
        let results = contact!.contacts.filter(aPossibleContact.name)
        if results.count == 1
        {
            cell.accessoryType = .Checkmark
        }
        else
        {
            cell.accessoryType = .None
        }
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.None
        {
            cell?.accessoryType = .Checkmark
            try! realm.write { () -> Void in
                
                self.contact!.contacts.append(self.allPeople[indexPath.row])
            }
        }
    }
}
