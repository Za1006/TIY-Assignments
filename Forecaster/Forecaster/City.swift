//
//  City.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class City
{
    let cityName: String!
    var weather: Forecast?
    let location: NSDictionary
    let lng: String
    let lat: String
    
    init(cityName: String, weather: Forecast?, location: NSDictionary, lat: String, lng: String)
    {
    
        self.cityName = cityName
        self.location = location
        self.lat = lat
        self.lng = lng 
        
        if weather != nil
        {
            self.weather = weather!
        }
        else
        {
            self.weather = nil
        }
     }
//    static func locationWithJSON(result: NSArray) -> Location
//    {
//        var location: Location
//        var city = ""
//        var state = ""
//        var lat = ""
//        var lng = ""
//        var zip = ""
//        
//        if results.count > 0
//        {
//            for result in results
//            {
//                let formattedAddress = result["formattedAddress"] as? String
//                if formattedAddress != nil
//                {
//                    let addressComponentsForcity = formattedAddress!.componentsSeparatedByString(",")
//                    city = String(addressComponentsForcity[0])
//                    
//                    let zip = String(addressComponentsForcity[1])
//                    state = zip.componentsSeparatedByString(" ")[1]
//                }
//                let geometry = result["gemetry"] as? NSDictionary
//                if geometry != nil
//                {
//                    let latLo = geometry?["location"] as? NSDictionary
//                    if latLo != nil
//                    {
//                        let lat = latLo?["lat"] as? Double
//                        let lng = latLo["lng"]as? Double
//                    }
//                }
//            }
//        }
//        location = Location(city: city, state: state, lat: lat, lng: lng, zip: zip, weather: nil)
//        return location
//    }
}