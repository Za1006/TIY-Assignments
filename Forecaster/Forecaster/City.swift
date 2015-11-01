//
//  City.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct City
{
    let cityName: String!
    var currentWeather: Forecast?
    let location: NSDictionary
    
    init(cityName: String, currentWeather: Forecast?, location: NSDictionary)
    {
        self.cityName = cityName
        self.location = location
        
        if forecast != nil
        {
            self.currentWeather = forecast!
        }
        else
        {
            self.currentWeather = nil
        }
    }
}