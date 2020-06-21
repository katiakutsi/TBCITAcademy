//
//  Weather.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let main: MainInfo
    let weather: [WeatherElement]
    var date: String?

    enum CodingKeys: String, CodingKey {
        case main, weather
        case date = "dt_txt"
    }
}

struct MainInfo: Codable {
    let temp: Double
}

struct WeatherElement: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

struct WeathersResponse: Codable {
    let weathers: [Weather]

    enum CodingKeys: String, CodingKey {
        case weathers = "list"
    }
}
