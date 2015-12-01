//
//  VenueSearchViewController.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol FoursquareAPIResultsProtocol
{
    func didReceiveAPIResults(results: NSDictionary)
}

class VenueSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,FoursquareAPIResultsProtocol,UISearchBarDelegate
{
    
    
    var delegate: VenueSearchDelegate?
    var venues = [NSManagedObject]()
    var apiDelegate: APIController!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Search Venue"
    

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarButtonTapped(searchBar: UISearchBar)
    {
        let term = searchBar.text
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        searchQueryToAPIController(term!)
    }
    
    func searchQueryToAPIController(searchTerm: String)
    {
        self.apiDelegate = APIController(delegate: self)
        apiDelegate.searchFoursquareFor(searchTerm)
    }
    func didReceiveAPIResults(results: NSDictionary)
    {
        var venuesArray = [NSManagedObject]()
        venuesArray = Venue.searchResultsJSON(results)
        self.venues = venuesArray
        
//        tableView.reloadData()
    }
//    MARK: - Table View Data
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return venues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueSearchCell", forIndexPath: indexPath)
        
        let aVenue = venues[indexPath.row]
        
        cell.textLabel!.text = aVenue.valueForKey("name") as? String
        cell.detailTextLabel!.text = aVenue.valueForKey("address") as? String
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let venue = venues[indexPath.row]
        delegate?.venueWasChoosen(venue)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
