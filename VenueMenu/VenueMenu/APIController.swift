//
//  APIController.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: FoursquareAPIResultsProtocol?
    
    init(delegate: FoursquareAPIResultsProtocol)
    {
        self.delegate = delegate
    }
    
    func searchFoursquareFor(searchTerm: String)
    {
        let location = "Orlando, FL"
        let escapedLocation = location.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())

        let urlPath = "https://api.foursquare.com/v2/venues/search?client_id=KQVWNK0N2IZG0JO5YEIHEM2LBSET02GOM3CSJQ4YFSP5PWAZ&client_secret=SUTWYTLTZPR1EJV3422DUFJQVICHSJCKG5WBW02ITASNOKIS&v=20130815&near=\(escapedLocation!)&query=\(escapedSearchTerm!)"

        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
         if error != nil
         {
            print(error!.localizedDescription)

         }
            else
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let responseDictionary: NSDictionary = dictionary["response"] as? NSDictionary
                    {
                        self.delegate!.didReceiveFoursquareAPIResults(responseDictionary)
                    }

                }
            }
        })
        task.resume()
        
    }
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}


