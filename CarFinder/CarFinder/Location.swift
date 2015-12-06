//
//  Location.swift
//  CarFinder
//
//  Created by Elizabeth Yeh on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

let kNameKey = "name"
let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

class Location: NSObject, NSCoding
{
    let name: String
    let lat: Double
    let lng: Double
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, lat: Double, lng: Double)
    {
        self.name = name
        self.lat = lat
        self.lng = lng
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String
            else { return nil }
        
        self.init(name: name, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
        
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.name, forKey: kNameKey)
        aCoder.encodeDouble(self.lat, forKey: kLatitudeKey)
        aCoder.encodeDouble(self.lng, forKey: kLongitudeKey)
    }
}