//
//  File.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Weather
{
    let city: String
    let lat: String
    let lng: String
    
    init(city: String, lat: String, lng: String)
    {
        self.city = city
        self.lat = lat
        self.lng = lng
    }
    
//    static func weatherInfoWithJSON(result: NSArray) -> [Weather]
//    {
//        var weathers = [Weather]()
//        if result.count > 0
//        {
//            for result in results
//            {
//                var city = result["formatted_address"] as? String
//                if city == nil
//                {
//                    city = results("" , "") as? String
//                }
//                var lat = result["location"] as? String
//                if lat == nil
//                {
//                    lat = results
//                }
//            }
//        }
//    }
}