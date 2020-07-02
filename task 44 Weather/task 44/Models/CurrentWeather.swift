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

struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}


struct CurrentWeatherElements: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}
