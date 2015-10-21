//
//  ListToDoTableViewController.swift
//  To-Do-List
//
//  Created by Elizabeth Yeh on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ListToDoTableViewController: UITableViewController
{
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var listToDo = Array<ListToDo>()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "List To Do"


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return listToDo.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListToDoCell", forIndexPath: indexPath) as! ListToDoCell
        
// Configure the cell...
        let aListToDo = listToDo[indexPath.row]
        if aListToDo.title == nil
        {
            cell.currentTitle.becomeFirstResponder()
            
        }
        else
        {
            cell.currentTitle.text = aListToDo.title
            
        }
        cell.countLabel.text = "\(aListToDo.count)"
//        cell.checkButton.value =

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
                    let aListToDo = listToDo[indexPath.row]
                    listToDo.removeAtIndex(indexPath.row)
                    managedObjectContext.deleteObject(aListToDo)
                    saveContext()
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField.text != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! ListToDoCell
            let indextPath = tableView.indexPathForCell(cell)
            let aListToDo = listToDo[indextPath!.row]
            aListToDo.title = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        
    return rc
}

// MARK: - Action Handlers
@IBAction func addCounter(sender: UIBarButtonItem)
{
    let aListToDo = NSEntityDescription.insertNewObjectForEntityForName("ListToDo", inManagedObjectContext: managedObjectContext) as! ListToDo
    listToDo.append(aListToDo)
    tableView.reloadData()
}
    
    @IBAction func button(sender: UIButton)
    {
    
        let contentView = sender.superview
        let cell = contentView?.superview as! ListToDoCell
        let indextPath = tableView.indexPathForCell(cell)
        let aListToDo = listToDo[indextPath!.row]
        let countAsInt = Int16()
        aListToDo.count = countAsInt
        cell.countLabel.text = "\(countAsInt)"
        saveContext()
    }

    }
//    MARK: - Private
    func saveContext()
    {
        do
        {
           try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror),\(nserror.userInfo)")
            abort()
        }
    }
