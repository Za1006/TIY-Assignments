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
    var allPeople: Results<Person>!
    let family: List<Person>!
    let friends: List<Person>!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var familyFriendSegmentedController: UISegmentedControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        allPeople = realm.objects(Person).filter("name !=%@", contact!.name).sorted("name")
        
        setLabel()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLabel()
    {
        nameLabel.text = contact!.name
        phoneNumberLabel.text = contact!.phoneNumber
        birthdayLabel.text = contact!.birthday
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
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
        let aPossibleContact = allPeople[indexPath.row]
        cell.textLabel?.text = aPossibleContact.name
        cell.detailTextLabel?.text = aPossibleContact.birthday
        let results = contact!.friends.filter("name == %@", aPossibleContact.name)
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
                
                self.contact!.name.append(self.allPeople[indexPath.row])
            }
        }
//        else
//        {
//            cell?.accessoryType = .None
//            try! realm.write {() -> Void in
//                
//                let indext = self.contact!.friends.indextOf(self.allPeople[indexPath.row])
//                self.contact!.friends.removeAtIndex(indext!)
//            }
        }
    }
    
    @IBAction func changeSortCriteria(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            allPeople = allPeople.sorted("firstName")
        }
        else
        {
            allPeople = allPeople.sorted("lastName")
        }
        tableView.reloadData()
    }

