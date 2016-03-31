//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Family on 3/28/16.
//  Copyright © 2016 Danial Taylor. All rights reserved.
//

import Foundation

struct CurrentWeather {

    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        let precipFloat = weatherDictionary["precipProbability"] as! Int
        precipProbability = Int(precipFloat * 100)
        summary = weatherDictionary["summary"] as! String
        
        
    }
}