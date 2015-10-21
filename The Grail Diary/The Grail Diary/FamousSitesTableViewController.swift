//
//  FamousSitesTableViewController.swift
//  The Grail Diary
//
//  Created by Elizabeth Yeh on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FamousSitesTableViewController: UITableViewController
{
    var place = Array<FamousPlaces>()
    var name: String = ""
    var location: String = ""
    var history: String = ""
    var attribute: String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Famouse Places"
        
        loadSITEList()

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return place.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("SiteNameCell", forIndexPath: indexPath) as! SiteNameCell
        
        let placeSite = place[indexPath.row]
        
        cell.nameOfSite.text = placeSite.siteName
        cell.locationOfSite.text = "location: " + placeSite.siteLocation
        cell.historyOfSite.text = "history: " + placeSite.siteHistory
        cell.attributeOfSite.text = "attribute: " + placeSite.siteAttribute

        return cell
    }
    
        func loadSITEList()
        {
            do
            {
                let filePath = NSBundle.mainBundle().pathForResource("SITE", ofType: "json")
                let dataFromFile = NSData(contentsOfFile: filePath!)
                let placeData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
                for placeDictionay in placeData
                {
                    let placeSite = FamousPlaces(dictionary: placeDictionay as! NSDictionary)
                    place.append(placeSite)
                }
//                catch let error as NSError
//                {
//                    print(error)
//                }
                

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


    }
}
}
