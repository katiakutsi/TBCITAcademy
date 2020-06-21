//
//  Weather.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let main: Main
    let weather: [WeatherElement]
    var date: String?

    enum CodingKeys: String, CodingKey {
        case main, weather
        case date = "dt_txt"
    }
}

