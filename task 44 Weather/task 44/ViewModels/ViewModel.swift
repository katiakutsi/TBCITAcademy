//
//  ViewModel.swift
//  task 44
//
//  Created by katia kutsi on 6/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import CoreLocation

struct ViewModel {
    
    
    public var getObjects = { (latit: Double, longit: Double, completion: @escaping ([(String,Weather)]) -> ()) in
    
        var weathers = [(String,Weather)]()
        let apiService = APIService()
        
        apiService.getWeathers(lat: latit, lon: longit) { (weathersResponse) in
            for weather in weathersResponse.weathers {
               
                let dateAndTime = weather.date!.split(separator: " ")
               
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from:String(dateAndTime[0]))
                let day = date?.dayOfWeek()
               
                if let dayname = day {
                    weathers.append((dayname,weather))
                }
            }
            completion(weathers)
        }
       
    }
}
