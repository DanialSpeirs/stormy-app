//
//  ForecastService.swift
//  Stormy
//
//  Created by Family on 4/5/16.
//  Copyright © 2016 Danial Taylor. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
                                       //https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE
    }
    
    func getForecast(lat: Double, long: Double, completion: (Forecast? -> Void)) {
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            
            let networkOperation = NetworkOperation(url: forecastURL)
            
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let forecast = Forecast(weatherDictionary: JSONDictionary)
                completion(forecast)
            }
            
        } else {
            print("Could not construct a valid URL")
        }
    }
    
    
}








