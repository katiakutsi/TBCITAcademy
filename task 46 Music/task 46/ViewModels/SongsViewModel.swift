//
//  SongsViewModel.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct SongsViewModel {
    
    
    public var getObjects = { (completion: @escaping ([Song]) -> ()) in
    
        var songs = [Song]()
        let apiService = APIService()
        
        apiService.getSongs(completion: { (playlist) in
            songs.append(contentsOf: playlist.tracks.songs)
            completion(songs)
        })
    }
}
