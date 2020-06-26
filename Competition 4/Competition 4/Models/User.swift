//
//  User.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable {
    let urls: Urls
    let user: UserClass
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}

// MARK: - UserClass
struct UserClass: Codable {
    let name: String
}

struct UsersResponse: Codable {
    let users : [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}
