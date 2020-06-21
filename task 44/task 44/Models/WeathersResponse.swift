//
//  WeathersResponse.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct WeathersResponse: Codable {
    let weathers: [Weather]

    enum CodingKeys: String, CodingKey {
        case weathers = "list"
    }
}
