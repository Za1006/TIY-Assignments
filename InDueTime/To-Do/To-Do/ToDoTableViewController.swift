//
//  ToDoTableViewController.swift
//  To-Do
//
//  Created by Elizabeth Yeh on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController, UITextFieldDelegate
{
    var toDos = Array<ToDo>()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "ToDo List"
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        
        let fetchRequest = NSFetchRequest(entityName: "ToDo")
        do {
            
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [ToDo]
            
            toDos = fetchResults!
            }
           catch
            {
               let nserror = error as NSError
               NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoCell

        let anItem = toDos[indexPath.row]
        if anItem.itemToDo == nil
        {
            cell.titleTextField .becomeFirstResponder()
        }
        else
        {
            cell.titleTextField.text = anItem.itemToDo
        }
        
        if anItem.isCompleted == false
        {
            cell.accessoryType = .None
        
        }
        else
        {
            cell.accessoryType = .Checkmark

        }
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
         let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.None
        {
            cell?.accessoryType = .Checkmark
        }
        else
        {
            cell?.accessoryType = .None
        }
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }



    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {

        if editingStyle == .Delete
        {
            
            let anItem = toDos[indexPath.row]
            if anItem.isCompleted
            {
              toDos.removeAtIndex(indexPath.row)
              managedObjectContext.deleteObject(anItem)
                
            }
            saveContext()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
         }

    }


    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! ToDoCell
            let indextPath = tableView.indexPathForCell(cell)
            let anItem = toDos[indextPath!.row]
            anItem.itemToDo = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        return rc
    }

    @IBAction func addToDo(sender: UIBarButtonItem)
    {
        let aToDo = NSEntityDescription.insertNewObjectForEntityForName("ToDo", inManagedObjectContext: managedObjectContext) as! ToDo
        toDos.append(aToDo)
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
    func saveContext ()
    {
        if managedObjectContext.hasChanges
        {
            do
            {
                try managedObjectContext.save()
            }
            catch
            {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
}
