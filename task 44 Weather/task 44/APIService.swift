//
//  APIService.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct APIService{
    
    func getCurrentWeather(lat: Double, lon: Double, completion: @escaping (CurrentWeather)->()) {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=c8461590508ca138d769ce32eb856bec")!
    
        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let data = data else {return}
        
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(CurrentWeather.self, from: data)
            
                completion(weather)
                
            } catch {print(error)}
            
        
        }.resume()
    }
    
    
    func getWeathers(lat: Double, lon: Double, completion: @escaping (WeathersResponse)->()) {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=c8461590508ca138d769ce32eb856bec")!
    
        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let data = data else {return}
        
            do {
                let decoder = JSONDecoder()
                let weathersResponse = try decoder.decode(WeathersResponse.self, from: data)
            
                completion(weathersResponse)
                
            } catch {print(error)}
            
        
        }.resume()
    }
}
