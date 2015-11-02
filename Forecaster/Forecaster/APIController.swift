//
//  APIController.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var networkAPI: NeworkAPIControllerProtocol
    var task: NSURLSessionDataTask!
    
    init(delegate: NeworkAPIControllerProtocol)
    {
        self.networkAPI = delegate
    }
    
//    func search(location: Location)
//    {
//        let lat = location.lat ;
//        let lng = location.lng
//        let url = NSURL(String: "https://api.forecast.io/forecast/76b9d9375f5efb27bc49c537599e4833/\(lat),%20\(lng)")
//        let session = NSURLSession.sharedSession()
//        task = session.dataTaskWithURL(url!, completionHandler: {data, reponse, error -> Void in
//            
//            if error != nil
//            {
//               print(error!.localizedDescription)
//            }
//            else
//            {
//               if let weatherDictionary = self.parseJSON(data!)
//            {
//                          
//            
//            self.networkAPI.networkSearch(dictionary, location: location)
//    
//            }
//            }
//            })
//            task.resume()
//    }
//    func cancelSearch()
//    {
//        task.cancel()
//    }
//    
//    func parseJSON(data: NSData) -> NSDictionary
//    {
//        do
//        {
//            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
//            return dictionary
//        }
//        catch let error as NSError
//        {
//            print(error)
//        }
//    }
}
