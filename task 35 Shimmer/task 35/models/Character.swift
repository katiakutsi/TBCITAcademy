//
//  Character.swift
//  task 35
//
//  Created by katia kutsi on 6/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name, status, species: String
    let gender: String
    let origin: Location
    let image: String
}

