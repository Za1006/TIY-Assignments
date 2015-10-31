//
//  File.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class Forecast
{
    let summary: String
    let temp: Double
    let apparentTemp: Double
    let humidity: Double
    let precipProbability: Double
    let moonphase: Double
    var image: String
    
    init(summary: String, temp: Double, apparentTemp: Double, humidity: Double, precipProbability: Double, moonphase: Double, image: String)
    {
        self.summary = summary
        self.temp = temp
        self.apparentTemp = apparentTemp
        self.humidity = humidity
        self.precipProbability = precipProbability
        self.moonphase = moonphase
        self.image = image
    }
    //    let 摘要 : String
    //    let 氣溫: Double
    //    let 室外溫度: Double
    //    let 濕氣: Double
    //    let 月相: Double
    //    let 有雨可能性: Double
    //    var image: String
    //
    //
    //    init (摘要: String, 氣溫: Double, 室外溫度: Double, 濕氣: Double, 月相: Double, 有雨可能性: Double, image: String)
    //    {
    //        self.摘要 = 摘要
    //        self.氣溫 = 氣溫
    //        self.室外溫度 = 室外溫度
    //        self.濕氣 = 濕氣
    //        self.月相 = 月相
    //        self.有雨可能性 = 有雨可能性
    //        self.image = image
}

func forecastWithJSON(currently: NSDictionary) -> Forecast
{
    var forecast = Forecast?()
    
    let summary = currently["summary"] as! String
    let image = currently["image"] as! String
    let precipProbability = currently["precipProbability"] as! Double
    let temp = currently["temperture"] as! Double
    let apparentTemp = currently["apparentTemp"] as! Double
    let humidity = currently["humidity"] as! Double
    let moonphase = currently["moonphase"] as! Double
    
    forecast = Forecast(summary: summary, temp: temp, apparentTemp: apparentTemp, humidity: humidity, precipProbability: precipProbability, moonphase: moonphase, image: image)
    
    return forecast!
    
}
