//
//  CharactersResponse.swift
//  task 35
//
//  Created by katia kutsi on 6/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct CharactersResponse : Codable{
    let characters : [Character]
    
    enum CodingKeys : String, CodingKey{
        case characters = "results"
    }
}
