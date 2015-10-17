//
//  JackpotTableViewController.swift
//  Jackpot
//
//  Created by Elizabeth Yeh on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol WinningTicketViewControllerDelegate
{
    func winningTicketWasAdded(ticket: JackpotTicket)
}

class JackpotTableViewController: UITableViewController,WinningTicketViewControllerDelegate
{
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
      var storeTicket = Array<JackpotTicket>()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        

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
        return storeTicket.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("JackpotCell", forIndexPath: indexPath)

        // Configure the cell...
        let aTicket = storeTicket[indexPath.row]
//        cell.numbersLabel.text = aTicket.description()
//        cell.textLabel?.text = "\(numbersInCell.ticket)"
        if aTicket.winner
        {
            cell.backgroundColor = UIColor.greenColor()
            cell.payOutLabel.text = aTicket.payOut
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
            cell.payOutLabel.text = ""
        }

        return cell
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

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath)
    {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.indentifier == "ShowWinningTicketSegue"
        {
            let winningTicketVC = segue.destinationViewController as! WinningTicketViewController
            winningTicketVC.delegate = self
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
//    MARK: - Winning ticket view controller delegate
    func winningTicketWasAdded(ticket: JackpotTicket)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        checkForWinnersUsingTicket(ticket)
    }

//    MARK: - Action Handler
    
    @IBAction func addTapped(sender: UIBarButtonItem)
    {
        _ = JackpotTicket()
//        let newPath = NSIndexPath(forRow: storeTicket.count, inSection: 0)
        storeTicket.append(JackpotTicket())
        self.tableView.reloadData()
    }

//    MARK: - Private methods
    func checkingForWinnersUsingTicket(winningTicket: JackpotTicket)
    {
        for ticket in tickets
        {
            ticket.compareWithTicket(winningTicket)
        }
        tableView.reloadData()
    }
}


