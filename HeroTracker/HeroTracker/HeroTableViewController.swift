//
//  HeroTableViewController.swift
//  HeroTracker
//
//  Created by Elizabeth Yeh on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController
{
    var heroes = Array<Hero>()
    override func viewDidLoad()
    {
        super.viewDidLoad()
      title = "S.H.I.E.L.D. Hero Tracker"

        loadHeroes()


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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return heroes.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroCell", forIndexPath: indexPath)

        // Configure the cell...
        let aHero = heroes[indexPath.row]
        cell.textLabel?.text = aHero.heroName
        cell.detailTextLabel?.text = aHero.homeWorld

        return cell
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedHero = heroes[indexPath.row]
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("HeroDetailViewController") as! HeroDetailViewController
        detailVC.hero = selectedHero
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
// instead of doing the segue use the func above by creating a viewController but not connecting it to the TableViewController
    
    
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
//    MARK: Navigation 


    
    
    private func loadHeroes()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options:[]) as! NSArray
            
            for heroDictionary in heroData
            {
                let aHero = Hero(dictionary: heroDictionary as! NSDictionary)
                heroes.append(aHero)
            }
            heroes.sortInPlace({ $0.name < $1.name})
            
            }
              catch let error as NSError
            {
                    print(error)
            }
            }
            
            
        }


