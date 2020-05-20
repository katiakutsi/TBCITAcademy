//
//  APIService.swift
//  country_search
//
//  Created by katia kutsi on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation



class APIService{
        
    func getCountry(completion: @escaping ([Country]) -> ()) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in

            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: data)
                
                completion(countries)
            } catch {
                print(error)
            }


        }.resume()
    }
}
