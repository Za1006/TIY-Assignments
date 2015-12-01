//
//  Venue.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Venue: NSManagedObject
{
    static func searchResultsJSON(results: NSDictionary) -> [NSManagedObject]
    {
        var venueResults = [NSManagedObject]()
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let venueArray = results.valueForKey("venues") as? NSArray
        
        for venue in venueArray!
        {
            let venueEntity = NSEntityDescription.entityForName("Venue", inManagedObjectContext: managedObjectContext)
            let aVenue = Venue(entity: venueEntity!,
                insertIntoManagedObjectContext: nil)
            
            aVenue.setValue(venue.valueForKey("name") as? String ?? "", forKey: "name")
            let location = venue.valueForKey("location") as? NSDictionary
            aVenue.setValue(location?.valueForKey("address") as? String ?? "", forKey: "address")
            aVenue.setValue(location?.valueForKey("lat") as? Double ?? 0.0, forKey: "lat")
            aVenue.setValue(location?.valueForKey("lng") as? Double ?? 0.0, forKey: "lng")
            aVenue.setValue(0, forKey: "rating")


            do {
                try managedObjectContext.save()
                venueResults.append(aVenue)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }


        }
        return venueResults


    }

}
