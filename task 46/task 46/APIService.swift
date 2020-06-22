//
//  APIService.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct APIService {
    func getSongs(completion: @escaping (Playlist)->()) {

        let url = URL(string: "https://api.deezer.com/playlist/908622995")!

        URLSession.shared.dataTask(with: url) { (data, res, err) in

            guard let data = data else {return}

            do {
                let decoder = JSONDecoder()
                
                let playlist = try decoder.decode(Playlist.self, from: data)

                completion(playlist)

            } catch {print(error)}

        
        }.resume()
    }
}
