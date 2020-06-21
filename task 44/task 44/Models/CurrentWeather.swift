//
//  CurrentWeather.swift
//  task 44
//
//  Created by katia kutsi on 6/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [CurrentWeatherElements]
    let main: Main
    let name: String
}

struct Coord: Codable {
    let lon, lat: Double
}

struct CurrentWeatherElements: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}
