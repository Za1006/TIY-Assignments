//
//  Hero.swift
//  HeroTracker
//
//  Created by Elizabeth Yeh on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Hero
{
    var name: String
    var homeWorld: String
    var powers: String
    
    init(dictionary: NSDictionary)
    {
        name = dictionary["name"] as! String
        homeWorld = dictionary["homeWorld"] as! String
        powers = dictionary["powers"] as! String
    }
    
}
