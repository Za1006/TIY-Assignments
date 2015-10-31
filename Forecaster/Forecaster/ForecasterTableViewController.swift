//
//  ForecasterTableViewController.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ForecasterTableViewController: UITableViewController
{
    
   
    var 城市 = ""
    var 目前的溫度 = ""
    var forecast = Array<Forecast>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "天氣"
        loadWeather()

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
        return forecast.count
    
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ForecasterCell", forIndexPath: indexPath) as! ForecasterCell

        // Configure the cell...
        let aForecast = forecast[indexPath.row]
        if aForecast.城市 == ""
        {
            forecast.removeAtIndex(indexPath.row)
            tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
//        else if aForecast.城市 != ""
//        {
//            cell.城市Label.text = aForecast.城市 + "," + aForecast.state
//            cell.目前的溫度Label = String(aForecast? .summary
//            if aForecast.weather?.temp != nil
//            {
//                cell.
//            }
//            
////
        }
//        cell.textLabel?.text = aWeather.城市
//        cell.detailTextLabel?.text = aWeather.目前的溫度
        
//        if indexPath.row % 2 == 0
//        {
//            cell.backgroundColor = UIColor.grayColor()
//        }
//        else
//        {
//            cell.backgroundColor = UIColor.whiteColor()
//        }
        return cell
    }
    
   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectLocatioin = weather[indexPath.row]
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("ForecastDetailViewController") as! ForecastDetailViewController
        detailVC.aWeather = selectedLocation
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    

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



