//
//  ViewController.swift
//  competition 3
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct Object: Codable {
    let objectTypeID, bankID, nameGe, nameEn: String
    let addressGe, addressRu, latitude, longtitude: String

    enum CodingKeys: String, CodingKey {
        case objectTypeID = "object_type_id"
        case bankID = "bank_id"
        case nameGe = "name_ge"
        case nameEn = "name_en"
        case addressGe = "address_ge"
        case addressRu = "address_ru"
        case latitude, longtitude
    }
}

struct ObjectsResponse: Codable {
    let objects: [Object]

    enum CodingKeys: String, CodingKey {
        case objects = "objects"
    }
}

class ViewController: UIViewController {
    
    var atms = [Object]()
    var branches = [Object]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHouses { (objectsResponse) in
            for object in objectsResponse.objects{
                if object.objectTypeID == "1" {
                    self.atms.append(object)
                }else{
                    self.branches.append(object)
                    print(object)
                }
            }
        }
        

    }
    
    func getHouses(completion: @escaping (ObjectsResponse)->()) {
    
        let url = URL(string: "https://run.mocky.io/v3/96016c7a-9b7a-4b7a-997e-3ebc860516a5")!
    
        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let data = data else {return}
        
            do {
                let decoder = JSONDecoder()
                let objectsResponse = try decoder.decode(ObjectsResponse.self, from: data)
            
                completion(objectsResponse)
                
            } catch {print(error)}
            
        
        }.resume()
    }
    
    func changeLang() {
        
    }
    
}

