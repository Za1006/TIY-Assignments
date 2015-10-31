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
    let 城市: String
    let 目前的溫度: String
    let lng: String
    
    init(城市: String, 目前的溫度: String, lng: String)
    {
        self.城市 = 城市
        self.目前的溫度 = 目前的溫度
        self.lng = lng
    }
    
//    static func weatherInfoWithJSON(result: NSArray) -> [Weather]
//    {
//        var weathers = [Weather]()
//        if result.count > 0
//        {
//            for result in results
//            {
//                var 城市 = result["formatted_address"] as? String
//                if 城市 == nil
//                {
//                    city = results("" , "") as? String
//                }
//                var 目前的溫度 = result["location"] as? String
//                if 目前的溫度 == nil
//                {
//                    目前的溫度 = results
//                }
//            }
//        }
//    }
}