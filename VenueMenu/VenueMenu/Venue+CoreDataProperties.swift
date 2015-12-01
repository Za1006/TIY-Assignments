//
//  Venue+CoreDataProperties.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import CoreData

extension Venue
{
    @NSManaged var name: String?
    @NSManaged var address: String?
    @NSManaged var lat: NSNumber?
    @NSManaged var lng: NSNumber?
    @NSManaged var rating: NSNumber?
}
