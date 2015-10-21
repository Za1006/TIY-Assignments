//
//  Places.swift
//  The Grail Diary
//
//  Created by Elizabeth Yeh on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class FamousPlaces
{
    var siteName: String
    var siteLocation: String
    var siteHistory: String
    var siteAttribute: String
    
    init(dictionary: NSDictionary)
    {
        siteName = dictionary["siteName"] as! String
        siteLocation = dictionary["siteLocation"] as! String
        siteHistory = dictionary["siteHistory"] as! String
        siteAttribute = dictionary["siteAttribute"] as! String
    }
}
