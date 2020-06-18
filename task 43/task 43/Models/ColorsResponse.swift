//
//  ColorsResponse.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct ColorsResponse : Codable{
    
    let colors : [Color]
    
    enum CodingKeys : String, CodingKey{
        case colors = "data"
    }
}
