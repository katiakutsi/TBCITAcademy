//
//  APIService.swift
//  task 54
//
//  Created by katia kutsi on 7/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct APIService {

    func getCharacters(completion: @escaping (CharactersResponse)->()) {

        let url = URL(string: "https://rickandmortyapi.com/api/character/")!

        URLSession.shared.dataTask(with: url) { (data, res, err) in
    
            guard let data = data else {return}
    
            do {
                let decoder = JSONDecoder()
                let charachtersResponse = try decoder.decode(CharactersResponse.self, from: data)
        
                completion(charachtersResponse)
            
            } catch {print(error)}
    
        }.resume()
    }
}
