//
//  FavoritesTableViewController.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol VenueSearchDelegate
{
    func venueWasChoosen(venue: NSManagedObject)
}

class FavoritesTableViewController: UITableViewController,VenueSearchDelegate
{
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var venues = Array<NSManagedObject>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "Favorite Venues"
        navigationItem.leftBarButtonItem = self.editButtonItem()

        
        let fetchRequest = NSFetchRequest(entityName: "Venue")
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Venue]
            venues = fetchResults!
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return venues.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoritesVenueCell", forIndexPath: indexPath) as! FavoritesVenueCell
        
         let aVenue = venues[indexPath.row]
        cell.favoritesLabel.text = aVenue.valueForKey("name") as? String
        cell.ratingLable.text = aVenue.valueForKey("rating")as? String

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let aVenue = venues[indexPath.row]
            venues.removeAtIndex(indexPath.row)
            managedObjectContext.deletedObjects(aVenue)
            saveContext()

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowVenueSearchSegue"
        {
            let destVC = segue.destinationViewController as! UINavigationController
            let modalVC = destVC.viewControllers[0] as! VenueSearchViewController
            modalVC.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let venueDetailVC = storyboard?.instantiateViewControllerWithIdentifier("VenueDetailViewController") as! VenueDetailViewController
        venueDetailVC.indexRow = indexPath.row
        venueDetailVC.venuesForDetailView = venues
        navigationController?.pushViewController(venueDetailVC, animated: true)
        
    }
    
    func venueWasChoosen(venue: NSManagedObject)
    {
        
    }


    func saveContext ()
    {
        if managedObjectContext.hasChanges
        {
            do
            {
                try managedObjectContext.save()
            } catch
            {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
     }
   }
}
