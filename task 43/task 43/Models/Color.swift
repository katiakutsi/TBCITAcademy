//
//  Colors.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Color : Codable{
    let id : Int
    let name : String
    let year : Int
    var code : String
    let pantoneValue: String

    enum CodingKeys : String, CodingKey{
        case id
        case name
        case year
        case code = "color"
        case pantoneValue = "pantone_value"
    }
}
