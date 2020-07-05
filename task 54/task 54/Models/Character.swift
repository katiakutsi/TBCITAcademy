//
//  Character.swift
//  task 54
//
//  Created by katia kutsi on 7/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name, status, species: String
    let gender: String
    let image: String
}

struct CharactersResponse : Codable{
    let characters : [Character]
    
    enum CodingKeys : String, CodingKey{
        case characters = "results"
    }
}
