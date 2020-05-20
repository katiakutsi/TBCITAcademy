//
//  Country.swift
//  country_search
//
//  Created by katia kutsi on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name:String
    let capital: String
    let region: String
    let borders:[String]
    let currencies: [Currency]
    let flag: String
}

struct Currency: Codable{
    let name: String?
    let symbol: String?
}
