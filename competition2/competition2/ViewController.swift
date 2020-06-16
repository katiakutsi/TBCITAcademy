//
//  ViewController.swift
//  competition2
//
//  Created by katia kutsi on 6/12/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

// MARK: - House
struct House: Codable {
    let rdcWebURL: String
    let propType: String
    let address: Address
    let propStatus: String
    let price, baths, beds: Int
    let buildingSize: BuildingSize

    enum CodingKeys: String, CodingKey {
        case rdcWebURL = "rdc_web_url"
        case propType = "prop_type"
        case address
        case propStatus = "prop_status"
        case price, baths, beds
        case buildingSize = "building_size"
    }
}

// MARK: - Address
struct Address: Codable {
    let city: String
    let neighborhoodName: String

    enum CodingKeys: String, CodingKey {
        case city
        case neighborhoodName = "neighborhood_name"
    }
}

// MARK: - BuildingSize
struct BuildingSize: Codable {
    let size: Int
    let units: String
}

struct HousesResponse: Codable {
    let houses: [House]

    enum CodingKeys: String, CodingKey {
        case houses = "properties"
    }
}


class ViewController: UIViewController {
    
    var houses = [House]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getHouses()
    }
    
    func getHouses() {
        let url = URL(string: "https://run.mocky.io/v3/12f8dc9f-0ef0-42ca-9b21-b50a7ef57d1b")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(HousesResponse.self, from: data)
                print(newsResponse.houses)
                self.houses.append(contentsOf: newsResponse.houses)
                
                DispatchQueue.main.async {
                    //self.tableView.reloadData()
                }
                
                print(self.houses)
                
            } catch {print(error)}
            
        }.resume()
    }

}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
