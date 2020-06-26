//
//  APIService.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct APIService {
    func getUsers(completion: @escaping (UsersResponse)->()) {

        let url = URL(string: "https://run.mocky.io/v3/7c0103d3-c651-44dc-808c-601dd21763b3")!

        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let data = data else {return}
        
            do {
                let decoder = JSONDecoder()
                let usersResponse = try decoder.decode(UsersResponse.self, from: data)
            
                completion(usersResponse)
                
            } catch {print(error)}
            
        
        }.resume()
    }

}

