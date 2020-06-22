//
//  Song.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Playlist: Codable {
    let tracks: SongsResponse
}

// MARK: - Song
struct Song: Codable {
    let artist: Artist
    let album: Album
}

// MARK: - Album
struct Album: Codable {
    let title: String
    let coverBig: String

    enum CodingKeys: String, CodingKey {
        case title
        case coverBig = "cover_big"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let name: String
}

struct SongsResponse: Codable {
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey{
        case songs = "data"
    }
}


